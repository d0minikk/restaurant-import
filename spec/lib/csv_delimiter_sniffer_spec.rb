require 'spec_helper'

describe CsvDelimiterSniffer do
  describe '.find' do
    context 'when , delimiter' do
      it "returns separator" do
        row = '1,10,15,1,2016,2016,1,1'
        delimiter = described_class.find(row)

        expect(delimiter).to eq(',')
      end
    end

    context "when ; delimiter" do
      it "returns separator" do
        row = '1;10;15;1;2016;2016;1;1'
        delimiter = described_class.find(row)

        expect(delimiter).to eq(';')
      end
    end

    context 'when | delimiter' do
      it 'returns separator' do
        row = '1|10|15|1|2016|2016|1|1'
        delimiter = described_class.find(row)

        expect(delimiter).to eq('|')
      end
    end

    context 'when no column separator is found' do
      it 'raises error' do
        row = ''

        expect { described_class.find(row) }.to raise_error(described_class::NoColumnSeparatorFound)
      end
    end
  end
end
