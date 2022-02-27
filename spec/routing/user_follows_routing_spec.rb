require "rails_helper"

RSpec.describe UserFollowsController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "/user_follows").to route_to("user_follows#create")
    end

    it "routes to #destroy" do
      expect(delete: "/user_follows/1").to route_to("user_follows#destroy", id: "1")
    end
  end
end
