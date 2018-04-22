class CsvDelimiterSniffer
  NoColumnSeparatorFound = Class.new(StandardError)

  COMMON_DELIMITERS = [',', '|', ';'].freeze

  def initialize(row)
    @row = row
  end

  def self.find(row)
    new(row).find
  end

  def find
    if valid?
      delimiters[0][0]
    else
      fail NoColumnSeparatorFound
    end
  end

  private

  def valid?
    !delimiters.collect(&:last).reduce(:+).zero?
  end

  def delimiters
    @delimiters ||= COMMON_DELIMITERS.inject({}, &count).sort(&most_found)
  end

  def most_found
    ->(a, b) { b[1] <=> a[1] }
  end

  def count
    ->(hash, delimiter) { hash[delimiter] = @row.count(delimiter); hash }
  end
end
