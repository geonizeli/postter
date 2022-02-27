require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#kind' do
    context 'when post have other post reference and a content' do
      it 'returns :quoted_post' do
        quoted_post = create(:post)
        post = create(:post, quoted_post: quoted_post)

        expect(post.kind).to eq(:quoted_post)
      end
    end

    context 'when post have other post reference and dont have a content' do
      it 'returns :repost' do
        quoted_post = create(:post)
        post = create(:post, quoted_post: quoted_post, content: nil)

        expect(post.kind).to eq(:repost)
      end
    end

    context 'when post dont have other post reference and have a content' do
      it 'returns :post' do
        post = create(:post)

        expect(post.kind).to eq(:post)
      end
    end
  end
end
