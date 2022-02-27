require 'rails_helper'

RSpec.describe "/users", type: :request do
  let(:valid_attributes) {
    {
      username: 'geonizeli'
    }
  }

  describe "GET /show" do
    it "renders a successful response" do
      user = User.create! valid_attributes
      get user_url(user), as: :json
      expect(response).to be_successful
    end
  end
end
