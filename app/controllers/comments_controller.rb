class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    topic = Topic.find(params[:topic_id])
    comment = topic.comments.build(comment_params)
    comment.user_id = current_user.id

    if comment.save
      flash[:notice] = "コメントしました"
      redirect_to topic_path(topic)
    else
      flash[:alert] = "コメントできませんでした"
      redirect_to topic_path(topic)
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.find(params[:id])

    if @comment.update(comment_params)
      flash[:notice] = "コメントを更新しました"
      redirect_to topic_path(@topic)
    else
      flash[:alert] = "更新できませんでした"
      render :edit
    end
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.build
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :image, :youtube_url)
    end
end