class PropublicaService
  
  def self.conn
    url = "https://api.propublica.org"
    conn = Faraday.new(url) do |faraday|
      faraday.headers['X-API-Key'] = ENV["PROPUBLICA_API_KEY"]
    end
  end

  def self.members_of_house(state)
    response = conn.get("/congress/v1/members/house/#{state}/current.json")
    json = JSON.parse(response.body, symbolize_names: true)
  end
end