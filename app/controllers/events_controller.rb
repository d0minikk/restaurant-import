class EventsController < ApplicationController
  def index
    @events = Event.all.page(params[:page])
  end
end
