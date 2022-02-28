require 'rails_helper'

RSpec.describe "/posts", type: :request do
  let(:user) { create(:user) }

  let(:valid_attributes) {
    {
      content: "Quo dolorem recusandae. Vero laborum deleniti. Qui ipsam illum.",
    }
  }

  let(:invalid_attributes) {
    {
      content: nil,
    }
  }

  let(:valid_headers) {
    {
      Cookie: "user_id=#{user.id}"
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      create(:post)
      get posts_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      post = create(:post)
      get post_url(post), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Post" do
        expect {
          post posts_url,
               params: { post: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Post, :count).by(1)
      end

      it "renders a JSON response with the new post" do
        post posts_url,
             params: { post: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Post" do
        expect {
          post posts_url,
               params: { post: invalid_attributes }, as: :json
        }.to change(Post, :count).by(0)
      end

      it "renders a JSON response with errors for the new post" do
        post posts_url,
             params: { post: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end
end
