class OccasionsController < ApplicationController
  def index
    @occasions = Occasion.all.page(params[:page])
  end

  def show
    @occasion = Occasion.find(params[:id])
  end
end
