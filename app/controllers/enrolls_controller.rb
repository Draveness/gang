class EnrollsController < ApplicationController
  before_action :set_enroll,
                only: %i[show update destroy]

  # GET /enrolls
  # GET /enrolls.json
  def index
    @enrolls = Enroll.all
    render json: @enrolls
  end

  # GET /enrolls/1
  # GET /enrolls/1.json
  def show
    render json: @enroll
  end

  # POST /enrolls
  # POST /enrolls.json
  def create
    @enroll = Enroll.new(enroll_params)

    if @enroll.save
      render :show, status: :created, location: @enroll
    else
      render json: @enroll.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /enrolls/1
  # PATCH/PUT /enrolls/1.json
  def update
    if @enroll.update(enroll_params)
      render :show, status: :ok, location: @enroll
    else
      render json: @enroll.errors, status: :unprocessable_entity
    end
  end

  # DELETE /enrolls/1
  # DELETE /enrolls/1.json
  def destroy
    @enroll.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enroll
      @enroll = Enroll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enroll_params
      params.fetch(:enroll, {})
    end
end
