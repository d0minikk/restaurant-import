class Importers::MenuForm < Importers::BaseForm
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

  def attributes
    {
      id:                   id,
      name:                 name,
      physical_description: physical_description,
      notes:                notes,
      call_number:          call_number,
      keywords:             keywords,
      language:             language,
      date:                 date,
      currency:             currency,
      currency_symbol:      currency_symbol,
      status:               status,
      page_count:           page_count,
      dish_count:           dish_count,
    }
  end

  def sponsor_attributes
    { name: sponsor }
  end

  def event_attributes
    { name: event }
  end

  def venue_attributes
    { name: venue }
  end

  def place_attributes
    { name: place }
  end

  def occasion_attributes
    { name: occasion }
  end

  def location_attributes
    { name: location, location_type: location_type }
  end
end
