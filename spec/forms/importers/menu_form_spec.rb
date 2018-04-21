describe Importers::MenuForm do
  it 'valid' do
    correct_row = '1;dinner;s;e;v;p;pd;o;n;cn;k;l;2016;l;lt;c;cs;s;pc;dc'
    form = described_class.new(correct_row)
    expect(form.valid?).to eq(true)
  end

  context 'invalid' do
    it 'id: presence' do
      incorrect_row = ';dinner;s;e;v;p;pd;o;n;cn;k;l;2016;l;lt;c;cs;s;pc;dc'
      form = described_class.new(incorrect_row)
      expect(form.valid?).to eq(false)
      expect(form.errors[:id]).to include("can't be blank")
    end

    it 'id: numericality' do
      incorrect_row = 'a;dinner;s;e;v;p;pd;o;n;cn;k;l;2016;l;lt;c;cs;s;pc;dc'
      form = described_class.new(incorrect_row)
      expect(form.valid?).to eq(false)
      expect(form.errors[:id]).to include("is not a number")
    end
  end
end
