require 'faraday'
require 'oj'

client = Faraday.new(url: 'http://localhost:3000') do |config|
  config.adapter  Faraday.default_adapter
  config.token_auth('8b5d77ab4bfa12cf4f1b993a23b48009')
end

response = client.post do |req|
  req.url '/api/v1/posts'
  req.headers['Content-Type'] = 'application/json'
  req.body = '{ "post": {"title": "i am a", "body": "nigger"} }'
end

puts Oj.load(response.body)
puts response.status
