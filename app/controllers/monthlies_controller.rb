class MonthliesController < ApplicationController
  before_action :set_monthly, only: [:show, :update, :destroy]
  skip_before_action :authorized

  # GET /monthlies
  def index
    @monthlies = Monthly.all

    render json: @monthlies
  end

  # GET /monthlies/1
  def show
    render json: @monthly
  end

  # POST /monthlies
  def create
    @monthly = session_user.monthlies.new(monthly_params)

    if @monthly.save
      render json: @monthly, status: :created, location: @monthly
    else
      render json: @monthly.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /monthlies/1
  def update
    if @monthly.update(monthly_params)
      render json: @monthly
    else
      render json: @monthly.errors, status: :unprocessable_entity
    end
  end

  # DELETE /monthlies/1
  def destroy
    @monthly.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monthly
      @monthly = Monthly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def monthly_params
      params.require(:monthly).permit(:date, :user_id)
    end
end
