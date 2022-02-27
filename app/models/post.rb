class Post < ApplicationRecord
  belongs_to :user
  belongs_to :quoted_post, optional: true, class_name: 'Post'

  validates :content, length: { maximum: 777 }
  validates :content, presence: true, if: :quoted_post?

  validate :user, :limit_of_post_per_day

  def kind
    if quoted_post?
      :quoted_post
    elsif repost?
      :repost
    else
      :post
    end
  end

  private

  def quoted_post?
    content.present? && quoted_post_id
  end

  def repost?
    content.blank? && quoted_post_id
  end

  def limit_of_post_per_day
    posts_from_day = user.posts.where('created_at >= ?', Time.zone.now.beginning_of_day)

    if posts_from_day.count >= 5
      errors.add(:base, 'You can post only 5 posts per day')
    end
  end
end
