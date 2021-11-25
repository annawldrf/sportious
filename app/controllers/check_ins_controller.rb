class CheckInsController < ApplicationController
  # def show
  #   @reservation = Reservation.find(params[:id])
  # end

  def create
    @court = Court.find(params[:court_id])
    @check_in = CheckIn.new(strong_params)
    @check_in.user = current_user
    @check_in.court = @court
    if @check_in.save
      redirect_to court_path(@check_in.court)
    else
      render "/courts/show"
    end
  end

  private

  def strong_params
    params.permit(:start_time, :end_time)
  end

end
