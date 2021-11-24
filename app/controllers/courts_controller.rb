class CourtsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def show
    @court = Court.find(params[:id])
  end

  def new
    @court = Court.new
  end

  def create
    @court = Court.new(strong_params)
    @court.user = current_user
    if @court.save
      redirect_to court_path(@court)
    else
      render :new
    end
  end

  private

  def strong_params
    params.require(:court).permit(:description, :court_type_id, :user_id, :address, :photo)
  end
end
