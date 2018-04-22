require 'csv'

class BaseImporter
  def initialize(import_task)
    @import_task = import_task
  end

  def import
    import_class
    :success
  rescue => e
    # Call exceptions tracker
    log_file.write("Something went wrong: #{e.message}")

    :failure
  ensure
    save_log_file
  end

  private

  def import_class
    CSV.foreach(file_path, csv_options).with_index(1) do |row, index|
      hash_row = row.to_h.reject{ |k,_| k.empty? }

      generate_and_import_from_row(hash_row, index)
    end
  end

  def csv_options
    { encoding: 'UTF-8', headers: true, skip_blanks: true }
  end

  def find_or_build_record_by_id(klass)
    @record = if @form.id.present?
      klass.find_or_initialize_by(id: @form.id)
    else
      klass.new
    end
  end

  def set_attributes
    @form.attributes.each do |attribute, value|
      @record[attribute] = value if value.present?
    end
  end

  def save!
    @record.save!
  end

  def add_row_errors_to_log(row, index)
    log_file.write("Line #{index} - #{row}; errors: #{@form.errors.full_messages}\n")
  end

  def file_path
    @import_task.file.path
  end

  def log_file
    @log_file ||= Tempfile.new(['log', '.txt'])
  end

  def save_log_file
    return if @log_file.blank?

    @import_task.update_attributes(log: log_file)
    log_file.close
  end
end
