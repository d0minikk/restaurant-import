describe Importers::MenuPageForm do
  it 'valid' do
    correct_row = '1;1;2;123;5;5;asd'
    form = described_class.new(correct_row)
    expect(form.valid?).to eq(true)
  end

  context 'invalid' do
    it 'id: presence' do
      incorrect_row = ';1;2;123;5;5;asd'
      form = described_class.new(incorrect_row)
      expect(form.valid?).to eq(false)
      expect(form.errors[:id]).to include("can't be blank")
    end

    it 'menu_id: presence' do
      incorrect_row = '1;;2;123;5;5;asd'
      form = described_class.new(incorrect_row)
      expect(form.valid?).to eq(false)
      expect(form.errors[:menu_id]).to include("can't be blank")
    end

    it 'id: numericality' do
      incorrect_row = 'a;1;2;123;5;5;asd'
      form = described_class.new(incorrect_row)
      expect(form.valid?).to eq(false)
      expect(form.errors[:id]).to include("is not a number")
    end

    it 'menu_id: numericality' do
      incorrect_row = '1;a;2;123;5;5;asd'
      form = described_class.new(incorrect_row)
      expect(form.valid?).to eq(false)
      expect(form.errors[:menu_id]).to include("is not a number")
    end
  end
end
