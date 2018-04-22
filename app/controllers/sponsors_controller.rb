class SponsorsController < ApplicationController
  def index
    @sponsors = Sponsor.all.page(params[:page])
  end

  def show
    @sponsor = Sponsor.find(params[:id])
  end
end
