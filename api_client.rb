require 'faraday'
require 'oj'

client = Faraday.new(url: 'http://localhost:3000') do |config|
  config.adapter  Faraday.default_adapter
  #config.token_auth('8bG6ZmuKsRK8ujOj96rAYQ')
end

response = client.get do |req|
  req.url '/api/v1/posts?page=3'
  req.headers['Content-Type'] = 'application/json'
  #req.body = ''
end

puts response.body
puts Oj.load(response.body)
puts response.status
