json.id @user.id
json.name @user.name
json.token @user.token
json.posts @user.posts do |post|
  json.id post.id
  json.title post.title
  json.body post.body
end
