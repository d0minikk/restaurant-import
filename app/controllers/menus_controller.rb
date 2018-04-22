class MenusController < ApplicationController
  def index
    @menus = Menu.all.page(params[:page])
  end

  def show
    @menu = Menu.find(params[:id])
  end
end
