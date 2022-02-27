class Post < ApplicationRecord
  belongs_to :user
  belongs_to :quoted_post, optional: true, class_name: 'Post'

  validates :content, length: { maximum: 777 }
  validates :content, presence: true, if: :quoted_post?

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
end
