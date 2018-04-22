class PlacesController < ApplicationController
  def index
    @places = Place.all.page(params[:page])
  end

  def show
    @place = Place.find(params[:id])
  end
end
