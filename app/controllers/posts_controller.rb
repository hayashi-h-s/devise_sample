class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]

  def index
    # @posts = Post.all
    @posts = Post.all.page(params[:page]).per(10)
    @post = Post.new
    @random = Post.order("RANDOM()").limit(1)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = Comment.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def post_params
    params.require(:post).permit(:content, :image)
  end
end