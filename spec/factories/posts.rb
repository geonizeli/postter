FactoryBot.define do
  factory :post do
    content { Faker::Lorem.paragraph }
    user
    quoted_post { nil }
  end
end
