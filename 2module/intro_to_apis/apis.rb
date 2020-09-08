require 'faraday'
require 'pry'
require 'json'

response = Faraday.get 'https://api.github.com/users/madking55'

body = response.body

binding.pry
# in your pry session run this code:
# json = JSON.parse(body, symbolize_names: true)