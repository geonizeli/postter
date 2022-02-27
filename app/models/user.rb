class User < ApplicationRecord
  validates :username,
            presence: true,
            uniqueness: true,
            length: { maximum: 14 },
            allow_nil: false,
            format: {
              with: /\A[a-zA-Z0-9]+\z/,
            }
end
