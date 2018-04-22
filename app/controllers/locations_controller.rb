class LocationsController < ApplicationController
  def index
    @locations = Location.all.page(params[:page])
  end
end
