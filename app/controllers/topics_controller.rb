class TopicsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    @topics = Topic.all
    @hot_topics = Topic.order(likes_count: :desc).limit(5)
    search = params[:search]
    if search.present?
      @topics = @topics.where(
        Topic.arel_table[:group_name].matches("%#{search}%")
        .or(Topic.arel_table[:title].matches("%#{search}%"))
      )
    end
  end

  def new
    @topic = Topic.new
  end

  def top 
    @topics = Topic.all.order(created_at: :desc).limit(5)  # 例：最新5件など
  end

  def create
    topic = Topic.new(topic_params)
    topic.user_id = current_user.id    
    if topic.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @comments = @topic.comments
    @comment = Comment.new
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    topic = Topic.find(params[:id])
    if topic.update(topic_params)
      redirect_to :action => "index", :id => topic.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    topic = Topic.find(params[:id])
    topic.destroy
    redirect_to action: :index
  end

  private
  def topic_params
    params.require(:topic).permit(:group_name, :title, :content, :image, :youtube_url)
  end


end
