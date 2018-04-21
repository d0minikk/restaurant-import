class ImportTaskForm
  include ActiveModel::Model

  attr_accessor :file, :importer_type

  validates :file, :importer_type, presence: true
  validate :csv_file

  def attributes
    {
      file: file,
      importer_type: importer_type,
    }
  end

  def csv_file
    return if file.blank?
    ext = File.extname(file.original_filename)

    if ext.downcase != '.csv'
      errors[:file] << 'invalid format. Only CSV type allowed.'
    end
  end
end
