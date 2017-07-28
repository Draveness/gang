class Topics::SubtopicsController < ApplicationController
  before_action :set_topic
  before_action :set_topic_subtopic, only: %i[show update destroy]

  def index
    @topic_subtopics = @topic.subtopics
  end

  def show; end

  def create
    @topic_subtopic = @topic.subtopics.build(topic_subtopic_params)

    if @topic_subtopic.save
      render :show, status: :created, location: topic_subtopic_url(@topic, @topic_subtopic)
    else
      render json: @topic_subtopic.errors, status: :unprocessable_entity
    end
  end

  def update
    if @topic_subtopic.update(topic_subtopic_params)
      render :show, status: :ok, location: topic_subtopic_url(@topic, @topic_subtopic)
    else
      render json: @topic_subtopic.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @topic_subtopic.destroy
  end

  private

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def set_topic_subtopic
    @topic_subtopic = @topic.subtopics.find(params[:id])
  end

  def topic_subtopic_params
    params.require(:topic_subtopic).permit(:content, :topic_id)
  end
end
