FactoryBot.define do
  factory :user_follow do
    follower { nil }
    followed { nil }
  end
end
