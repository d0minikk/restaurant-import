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

  def initialize(row)
    values = extract_values(row)
    attributes = {
      id:          values[0],
      menu_id:     values[1],
      page_number: values[2],
      image_id:    values[3],
      full_height: values[4],
      full_width:  values[5],
      uuid:        values[6],
    }
    super(attributes)
  end

  def menu_attributes
    {
      id:          id,
      menu_id:     menu_id,
      page_number: page_number,
      image_id:    image_id,
      full_height: full_height,
      full_width:  full_width,
      uuid:        uuid,
    }
  end
end
