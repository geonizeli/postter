class UserFollow < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  validate :followed, :user_cant_follow_himself

  private

  def user_cant_follow_himself
    errors.add(:followed, 'can\'t follow himself') if follower_id == followed_id
  end
end
