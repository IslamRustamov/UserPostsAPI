require 'faraday'
require 'oj'

client = Faraday.new(url: 'http://localhost:3000') do |config|
  config.adapter  Faraday.default_adapter
  config.token_auth('3d6e557bf913b443d7a80d3e67a52484')
end

response = client.delete do |req|
  req.url '/api/v1/users/2'
  req.headers['Content-Type'] = 'application/json'
end

puts Oj.load(response.body)
puts response.status
