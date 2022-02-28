require 'rails_helper'

RSpec.describe "/user_follows", type: :request do
  let(:followed) { create(:user) }
  let(:follower) { create(:user) }

  let(:valid_attributes) {
    {
      followed_id: followed.id,
    }
  }

  let(:invalid_attributes) {
    {
      followed_id: 'invalid_id',
    }
  }

  let(:valid_headers) {
    {
      Cookie: "user_id=#{follower.id}"
    }
  }

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new UserFollow" do
        expect {
          post user_follows_url,
               params: { user_follow: valid_attributes }, headers: valid_headers, as: :json
        }.to change(UserFollow, :count).by(1)
      end

      it "renders a JSON response with the new user_follow" do
        post user_follows_url,
             params: { user_follow: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new UserFollow" do
        expect {
          post user_follows_url,
               params: { user_follow: invalid_attributes }, as: :json
        }.to change(UserFollow, :count).by(0)
      end

      it "renders a JSON response with errors for the new user_follow" do
        post user_follows_url,
             params: { user_follow: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested user_follow" do
      user_follow = create(:user_follow, follower: follower, followed: followed)
      expect {
        delete user_follow_url(user_follow), headers: valid_headers, as: :json
      }.to change(UserFollow, :count).by(-1)
    end
  end
end
