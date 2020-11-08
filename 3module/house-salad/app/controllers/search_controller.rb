class SearchController < ApplicationController
  def index
    state = params[:state]
    url = "https://api.propublica.org"
    conn = Faraday.new(url) do |faraday|
      faraday.headers['X-API-Key'] = ENV["PROPUBLICA_API_KEY"]
    end

    response = conn.get("/congress/v1/members/house/#{state}/current.json")
    json = JSON.parse(response.body, symbolize_names: true)
    @members = json[:results].map do |member_data|
      # binding.pry
      Member.new(member_data)
    end
  end
end