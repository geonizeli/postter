class UserFollowsController < ApplicationController
  before_action :set_user_follow, only: %i[ show update destroy ]

  # GET /user_follows
  # GET /user_follows.json
  def index
    @user_follows = UserFollow.all
  end

  # GET /user_follows/1
  # GET /user_follows/1.json
  def show
  end

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

  # PATCH/PUT /user_follows/1
  # PATCH/PUT /user_follows/1.json
  def update
    if @user_follow.update(user_follow_params)
      render :show, status: :ok, location: @user_follow
    else
      render json: @user_follow.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_follows/1
  # DELETE /user_follows/1.json
  def destroy
    @user_follow.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_follow
      @user_follow = UserFollow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_follow_params
      params.require(:user_follow).permit(:follower_id, :followed_id)
    end
end
