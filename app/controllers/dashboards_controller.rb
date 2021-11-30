class DashboardsController < ApplicationController
  def show
    @favorites = current_user.all_favorites
  end
end
