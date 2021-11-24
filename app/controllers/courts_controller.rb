class CourtsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def show
    @court = Court.find(params[:id])
  end
end
