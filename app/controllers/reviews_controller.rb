class ReviewsController < ApplicationController
  def show
    @reviews = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @court = Court.find(params[:court_id])
    @review = Review.new(strong_params)
    @review.user = current_user
    @review.court = @court
    if @review.save
      redirect_to court_path(@court)
    else
      render "/courts/show"
      flash[:alert] = "Something went wrong"
    end
  end

  private

  def strong_params
    params.require(:review).permit(:rating, :title, :content)
  end

end
