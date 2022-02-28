class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @posts = PostsQueryResolverService.call(query_params, current_user)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new({
      user: current_user,
      **post_params
    })

    if @post.save
      render :show, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private

  def query_params
    params.permit(:scope, :terms, :user_id)
  end

  def post_params
    params.require(:post).permit(:content, :quoted_post_id)
  end
end
