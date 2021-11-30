class LessonsController < ApplicationController

  def index
    @lessons = Court.find(params[:court_id]).lessons
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(strong_params)
    @lesson.user = current_user
    if @lesson.save
      redirect_to lesson_path(@lesson)
    else
      render :new
    end
  end

  private

  def strong_params
    params.require(:lesson).permit(:title, :description, :start_time, :end_time, :capacity, :price, :user_id, :court_id)
  end

end
