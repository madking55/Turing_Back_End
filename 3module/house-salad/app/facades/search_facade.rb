class SearchFacade 
  def self.members(state)
    url = "https://api.propublica.org"
    conn = Faraday.new(url) do |faraday|
      faraday.headers['X-API-Key'] = ENV["PROPUBLICA_API_KEY"]
    end

    response = conn.get("/congress/v1/members/house/#{state}/current.json")
    json = JSON.parse(response.body, symbolize_names: true)
    @members = json[:results].map do |member_data|
      Member.new(member_data)
    end
  end
end