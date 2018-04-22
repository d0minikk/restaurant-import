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
end
