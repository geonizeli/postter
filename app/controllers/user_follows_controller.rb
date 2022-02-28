class UserFollowsController < ApplicationController
  # POST /user_follows
  # POST /user_follows.json
  def create
    @user_follow = UserFollow.new(user_follow_params)

    if @user_follow.save
      render :show, status: :created, location: @user_follow
    else
      render json: @user_follow.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_follows/1
  # DELETE /user_follows/1.json
  def destroy
    UserFollow.find(params[:id]).destroy
  end

  private

  # Only allow a list of trusted parameters through.
  def user_follow_params
    {
      follower: current_user,
      **params.require(:user_follow).permit(:followed_id)
    }
  end
end
