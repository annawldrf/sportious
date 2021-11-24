class CourtsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @courts = Court.all
    @markers = @courts.geocoded.map do |court|
      {
        lat: court.latitude,
        lng: court.longitude,
        info_window: render_to_string(partial: "info_window", locals: { court: court })
      }
    end

  def show
    @court = Court.find(params[:id])
  end
end
