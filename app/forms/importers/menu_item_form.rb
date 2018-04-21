class Importers::MenuItemForm
  include ActiveModel::Model

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

  def initialize(row)
    values = row.split(';', -1)
    attributes = {
      id:           values[0],
      menu_page_id: values[1],
      price:        values[2],
      high_price:   values[3],
      dish_id:      values[4],
      created_at:   values[5],
      updated_at:   values[6],
      xpos:         values[7],
      ypos:         values[8],
    }
    super(attributes)
  end

  def menu_attributes
    {
      id:           id,
      menu_page_id: menu_page_id,
      price:        price,
      high_price:   high_price,
      dish_id:      dish_id,
      created_at:   created_at,
      updated_at:   updated_at,
      xpos:         xpos,
      ypos:         ypos,
    }
  end
end
