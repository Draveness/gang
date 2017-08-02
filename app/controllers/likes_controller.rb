class LikesController < ApplicationController
  before_action :set_like,
                only: %i[show update destroy]

  # GET /likes
  # GET /likes.json
  def index
    @likes = Like.all
    render json: @likes
  end

  # GET /likes/1
  # GET /likes/1.json
  def show
    render json: @like
  end

  # POST /likes
  # POST /likes.json
  def create
    @like = Like.new(like_params)

    if @like.save
      render :show, status: :created, location: @like
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /likes/1
  # PATCH/PUT /likes/1.json
  def update
    if @like.update(like_params)
      render :show, status: :ok, location: @like
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  # DELETE /likes/1
  # DELETE /likes/1.json
  def destroy
    @like.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def like_params
      params.require(:activity).permit(:user1, :user2)
      # params.fetch(:like, {})
    end
end
