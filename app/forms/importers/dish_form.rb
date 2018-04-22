class Importers::DishForm < Importers::BaseForm
  attr_accessor(
    :id,
    :name,
    :description,
    :menus_appeared,
    :times_appeared,
    :first_appeared,
    :last_appeared,
    :lowest_price,
    :highest_price,
  )

  validates :id, :name, presence: true
  validates :id, numericality: true

  def initialize(row)
    values = extract_values(row)
    attributes = {
      id:             values[0],
      name:           values[1],
      description:    values[2],
      menus_appeared: values[3],
      times_appeared: values[4],
      first_appeared: values[5],
      last_appeared:  values[6],
      lowest_price:   values[7],
      highest_price:  values[8],
    }
    super(attributes)
  end

  def menu_attributes
    {
      id:             id,
      name:           name,
      description:    description,
      menus_appeared: menus_appeared,
      times_appeared: times_appeared,
      first_appeared: first_appeared,
      last_appeared:  last_appeared,
      lowest_price:   lowest_price,
      highest_price:  highest_price,
    }
  end
end
