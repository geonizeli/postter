FactoryBot.define do
  factory :user do
    username { Faker::Internet.username.gsub(/[^0-9a-z ]/i, '') }
  end
end
