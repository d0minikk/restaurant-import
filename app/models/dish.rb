class Dish < ApplicationRecord
  has_many :menu_items
  has_many :menu_pages, through: :menu_items
end
