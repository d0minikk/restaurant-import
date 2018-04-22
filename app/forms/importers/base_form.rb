class Importers::BaseForm
  include ActiveModel::Model

  def extract_values(row)
    delimiter = CsvDelimiterSniffer.find(row)
    row.split(delimiter, -1)
  end
end
