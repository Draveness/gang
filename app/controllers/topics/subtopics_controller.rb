class Topics::SubtopicsController < ApplicationController
  before_action :set_topics_subtopic, only: %i[show update destroy]

  # GET /topics/subtopics
  # GET /topics/subtopics.json
  def index
    @topics_subtopics = Topics::Subtopic.all
  end

  # GET /topics/subtopics/1
  # GET /topics/subtopics/1.json
  def show; end

  # POST /topics/subtopics
  # POST /topics/subtopics.json
  def create
    @topics_subtopic = Topics::Subtopic.new(topics_subtopic_params)

    if @topics_subtopic.save
      render :show, status: :created, location: @topics_subtopic
    else
      render json: @topics_subtopic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /topics/subtopics/1
  # PATCH/PUT /topics/subtopics/1.json
  def update
    if @topics_subtopic.update(topics_subtopic_params)
      render :show, status: :ok, location: @topics_subtopic
    else
      render json: @topics_subtopic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /topics/subtopics/1
  # DELETE /topics/subtopics/1.json
  def destroy
    @topics_subtopic.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_topics_subtopic
    @topics_subtopic = Topics::Subtopic.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def topics_subtopic_params
    params.require(:topics_subtopic).permit(:content, :topic_id)
  end
end
