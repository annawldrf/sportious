class CourtsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @courts = Court.all.geocoded
    selected_courts = []
    if params[:volleyball].present?
      selected_courts << @courts.select { |court| court.court_type.name == "Beach-Volleyball" }
    end

    if params[:basketball].present?
      selected_courts << @courts.select { |court| court.court_type.name == "Basketball" }
    end

    if params[:ping_pong].present?
      selected_courts << @courts.select { |court| court.court_type.name == "Ping-Pong" }
    end

    if selected_courts.empty?
      @markers = @courts.map do |court|
        {
        lat: court.latitude,
        lng: court.longitude,
        info_window: render_to_string(partial: "info_window", locals: { court: court }),
        image_url: helpers.asset_url("#{court.court_type.name}.png"),
        }
      end
    else
      @markers = selected_courts.flatten.map do |court|
        {
        lat: court.latitude,
        lng: court.longitude,
        info_window: render_to_string(partial: "info_window", locals: { court: court }),
        image_url: helpers.asset_url("#{court.court_type.name}.png"),
        }
      end
    end
  end

  def show
    @court = Court.find(params[:id])
    @latest_checkin = @court.current_check_ins.select { |checkin| checkin.user == current_user }.first unless @court.current_check_ins.empty?
    # raise
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
