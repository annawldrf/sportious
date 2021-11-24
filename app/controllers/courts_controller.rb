class CourtsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  def index
    @courts = Court.all
    @markers = @courts.geocoded.map do |court|
      {
        lat: court.latitude,
        lng: court.longitude,
        image_url: helpers.asset_url("icon.png")
      }
    end
  end
end
