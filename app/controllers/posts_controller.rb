class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]

  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    #エラーを聞く。下記では表示される
    @comment_sample = Comment.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
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
    params.require(:post).permit(:content)
  end
end
