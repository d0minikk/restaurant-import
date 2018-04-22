class DishesImporter < BaseImporter
  private

  def generate_and_import_from_row(row, index)
    @form = Importers::DishForm.new(row)

    if @form.valid?
      ActiveRecord::Base.transaction do
        find_or_build_record_by_id(Dish)
        set_attributes
        save!
      end
    else
      add_row_errors_to_log(row, index)
    end
  end
end
