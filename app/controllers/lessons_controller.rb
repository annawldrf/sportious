class LessonsController < ApplicationController

  def index
    @lessons = Court.find(params[:court_id]).lessons
  end

  def new
    @lesson = Lesson.new
    @court = Court.find(params[:court_id])
  end

  def create
    @lesson = Lesson.new(strong_params)
    @lesson.user = current_user
    court = Court.find(params[:court_id])
    @lesson.court = court
    if @lesson.save
      redirect_to court_path(court)
    else
      render :new
    end
  end

  private

  def strong_params
    params.require(:lesson).permit(:title, :description, :start_time, :end_time, :capacity, :price, :user_id, :court_id, :photo)
  end

end
