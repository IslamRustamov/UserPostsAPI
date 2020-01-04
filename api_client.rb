require 'faraday'
require 'oj'

client = Faraday.new(url: 'http://localhost:3000') do |config|
  config.adapter  Faraday.default_adapter
end

client = Faraday.new(url: 'http://localhost:3000') do |config|
  config.adapter  Faraday.default_adapter
  config.token_auth('92b48dbb87c834a26afe2b53c80e233c')
end

response = client.delete do |req|
  req.url '/api/v1/posts/6'
  req.headers['Content-Type'] = 'application/json'
end

puts Oj.load(response.body)
puts response.status
