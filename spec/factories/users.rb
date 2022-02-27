FactoryBot.define do
  factory :user do
    username {
      Faker::Internet.username[0..14]
        .gsub(/[^0-9a-z ]/i, '')
    }
  end
end
