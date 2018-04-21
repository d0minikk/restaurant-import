class Importers::MenuForm
  include ActiveModel::Model

  attr_accessor(
    :id,
    :name,
    :sponsor,
    :event,
    :venue,
    :place,
    :physical_description,
    :occasion,
    :notes,
    :call_number,
    :keywords,
    :language,
    :date,
    :location,
    :location_type,
    :currency,
    :currency_symbol,
    :status,
    :page_count,
    :dish_count,
  )

  validates :id, presence: true, numericality: true

  def initialize(row)
    values = row.split(';', -1)
    attributes = {
      id:                   values[0],
      name:                 values[1],
      sponsor:              values[2],
      event:                values[3],
      venue:                values[4],
      place:                values[5],
      physical_description: values[6],
      occasion:             values[7],
      notes:                values[8],
      call_number:          values[9],
      keywords:             values[10],
      language:             values[11],
      date:                 values[12],
      location:             values[13],
      location_type:        values[14],
      currency:             values[15],
      currency_symbol:      values[16],
      status:               values[17],
      page_count:           values[18],
      dish_count:           values[19],
    }
    super(attributes)
  end

  def menu_attributes
    {
      id:                   id,
      name:                 name,
      sponsor:              sponsor,
      event:                event,
      venue:                venue,
      place:                place,
      physical_description: physical_description,
      occasion:             occasion,
      notes:                notes,
      call_number:          call_numbe,
      keywords:             keywords,
      language:             language,
      date:                 date,
      location:             location,
      location_type:        location_type,
      currency:             currency,
      currency_symbol:      currency_symbol,
      status:               status,
      page_count:           page_count,
      dish_count:           dish_count,
    }
  end
end
