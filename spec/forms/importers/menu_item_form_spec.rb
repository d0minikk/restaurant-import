describe Importers::MenuItemForm do
  it 'valid' do
    correct_row = '1;1;10;15;1;2016;2016;1;1'
    form = described_class.new(correct_row)
    expect(form.valid?).to eq(true)
  end

  context 'invalid' do
    it 'menu_page_id: presence' do
      incorrect_row = '1;;10;15;1;2016;2016;1;1'
      form = described_class.new(incorrect_row)
      expect(form.valid?).to eq(false)
      expect(form.errors[:menu_page_id]).to include("can't be blank")
    end

    it 'dish_id: presence' do
      incorrect_row = '1;1;10;15;;2016;2016;1;1'
      form = described_class.new(incorrect_row)
      expect(form.valid?).to eq(false)
      expect(form.errors[:dish_id]).to include("can't be blank")
    end

    it 'menu_page_id: numericality' do
      incorrect_row = '1;a;10;15;1;2016;2016;1;1'
      form = described_class.new(incorrect_row)
      expect(form.valid?).to eq(false)
      expect(form.errors[:menu_page_id]).to include("is not a number")
    end

    it 'dish_id: numericality' do
      incorrect_row = '1;1;10;15;a;2016;2016;1;1'
      form = described_class.new(incorrect_row)
      expect(form.valid?).to eq(false)
      expect(form.errors[:dish_id]).to include("is not a number")
    end
  end
end
