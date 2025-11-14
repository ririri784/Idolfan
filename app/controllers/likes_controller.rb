class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @likeable = find_likeable
    @like = @likeable.likes.new(user: current_user)

    if @like.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path, alert: "すでにいいねしています。")
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  # 🔥 ここを全面書き換え（polymorphic対応）
  def find_likeable
    params[:likeable_type].constantize.find(params[:likeable_id])
  end
end


