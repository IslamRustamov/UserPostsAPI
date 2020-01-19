FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    token { SecureRandom.urlsafe_base64 }
  end
end
