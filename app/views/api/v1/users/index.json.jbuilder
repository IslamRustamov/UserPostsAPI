json.array! @users do |user|
  json.name user["name"]
  json.email user["email"]
  json.title user["title"]
  json.body user["body"]
end
