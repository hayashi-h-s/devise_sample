class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(post_id: params[:post_id])
    #createは（モデルを生成後に保存）
    #!は例外を出す
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end