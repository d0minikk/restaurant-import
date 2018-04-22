class DishesController < ApplicationController
  def index
    @dishes = Dish.all.page(params[:page])
  end
end
