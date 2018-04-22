class VenuesController < ApplicationController
  def index
    @venues = Venue.all.page(params[:page])
  end
end
