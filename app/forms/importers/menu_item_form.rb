class Importers::MenuItemForm < Importers::BaseForm
  attr_accessor(
    :id,
    :menu_page_id,
    :price,
    :high_price,
    :dish_id,
    :created_at,
    :updated_at,
    :xpos,
    :ypos,
  )

  validates :menu_page_id, :dish_id, presence: true, numericality: true
end
