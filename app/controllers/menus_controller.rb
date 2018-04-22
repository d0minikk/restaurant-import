class MenusController < ApplicationController
  def index
    @menus = Menu.all.page(params[:page])
  end

  def show
    @menu = Menu.find(params[:id])
    @menu_pages = @menu.menu_pages.order(:page_number).includes(:menu_items, :dishes)
  end
end
