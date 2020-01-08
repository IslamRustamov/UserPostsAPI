20.times do
  user = User.create({ name: Faker::Name.name, email: Faker::Internet.email })
  3.times do
    user.posts.create({ title: Faker::Book.title, body: Faker::Lorem.sentence })
  end
end
