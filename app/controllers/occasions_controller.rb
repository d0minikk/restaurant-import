class OccasionsController < ApplicationController
  def index
    @occasions = Occasion.all.page(params[:page])
  end
end
