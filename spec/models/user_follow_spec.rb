require 'rails_helper'

RSpec.describe UserFollow, type: :model do
  describe 'validations' do
    context 'and user try to follow her-self' do
      it 'raise error' do
        user = create(:user)
        user_follow = build(:user_follow, follower_id: user.id, followed_id: user.id)

        expect(user_follow).to_not be_valid
      end
    end
  end
end
