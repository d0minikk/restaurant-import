class MenusImporter < BaseImporter
  private

  def generate_and_import_from_row(row, index)
    @form = Importers::MenuForm.new(row)

    if @form.valid?
      ActiveRecord::Base.transaction do
        find_or_build_record_by_id(Menu)

        set_attributes
        set_sponsor
        set_event
        set_venue
        set_place
        set_occasion
        set_location

        save!
      end
    else
      add_row_errors_to_log(row, index)
    end
  end

  def set_sponsor
    return if @form.sponsor.blank?

    sponsor = Sponsor.find_or_create_by(@form.sponsor_attributes)
    @record.sponsor = sponsor
  end

  def set_event
    return if @form.event.blank?

    event = Event.find_or_create_by(@form.event_attributes)
    @record.event = event
  end

  def set_venue
    return if @form.venue.blank?

    venue = Venue.find_or_create_by(@form.venue_attributes)
    @record.venue = venue
  end

  def set_place
    return if @form.place.blank?

    place = Place.find_or_create_by(@form.place_attributes)
    @record.place = place
  end

  def set_occasion
    return if @form.occasion.blank?

    occasion = Occasion.find_or_create_by(@form.occasion_attributes)
    @record.occasion = occasion
  end

  def set_location
    return if @form.location.blank?

    location = Location.find_or_create_by(@form.location_attributes)
    @record.location = location
  end
end
