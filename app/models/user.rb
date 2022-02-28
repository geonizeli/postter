class User < ApplicationRecord
  validates :username,
            presence: true,
            uniqueness: true,
            length: { maximum: 14 },
            allow_nil: false,
            format: {
              with: /\A[a-zA-Z0-9]+\z/,
            }

  has_many :posts

  has_many :user_follows_following, class_name: 'UserFollow', foreign_key: :follower_id
  has_many :user_follows_followers, class_name: 'UserFollow', foreign_key: :followed_id
  has_many :following, through: :user_follows_following, source: :followed
  has_many :followers, through: :user_follows_followers, source: :follower
end
