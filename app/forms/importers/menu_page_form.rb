class Importers::MenuPageForm < Importers::BaseForm
  attr_accessor(
    :id,
    :menu_id,
    :page_number,
    :image_id,
    :full_height,
    :full_width,
    :uuid,
  )

  validates :id, :menu_id, presence: true, numericality: true
end
