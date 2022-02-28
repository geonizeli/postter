class Post < ApplicationRecord
  belongs_to :user
  belongs_to :quoted_post, optional: true, class_name: 'Post'

  validates :content, length: { maximum: 777 }
  validates :content, presence: true, unless: :repost?

  validate :user, :limit_of_post_per_day

  scope :by_user_follows, ->(user) {
    where(user_id: user.following_ids)
  }

  def repost?
    kind == :quoted_post
  end

  def kind
    if quoted_post_id.blank?
      :post
    elsif content.blank? && quoted_post_id.present?
      :repost
    else
      :quoted_post
    end
  end

  private

  def limit_of_post_per_day
    posts_from_day = user&.posts&.where('created_at >= ?', Time.zone.now.beginning_of_day)

    return if posts_from_day && posts_from_day.count < 5

    errors.add(:base, 'You can post only 5 posts per day')
  end
end
