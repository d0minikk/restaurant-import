class ImportTaskForm
  include ActiveModel::Model

  attr_accessor :file, :importer_type

  validates :file, :importer_type, presence: true
  validate :csv_file
  validate :csv_delimiter

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

  def csv_delimiter
    return if file.blank?

    header = File.open(file.path).first
    return if header.blank?

    CsvDelimiterSniffer.find(header)
  rescue CsvDelimiterSniffer::NoColumnSeparatorFound
    errors[:file] << 'invalid format. Wrong delimiter in file.'
  end
end
