class TopicsController < ApplicationController
  before_action :set_topic, only: %i[show update destroy]

  def index
    @topics = Topic.all
  end

  def show; end

  def create
    @topic = Topic.new topic_params

    if @topic.save
      subtopics_params[:subtopics].each do |subtopic|
        @topic.subtopics.create content: subtopic
      end
      render :show, status: :created, location: @topic
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  def update
    if @topic.update topic_params
      render :show, status: :ok, location: @topic
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @topic.destroy
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:name, :category_id)
  end

  def subtopics_params
    params.require(:topic).permit(subtopics: [])
  end
end
