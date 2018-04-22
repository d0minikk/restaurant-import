describe Importers::MenuItemForm do
  it 'valid' do
    correct_row = FactoryGirl.attributes_for(:menu_item_import_row)
    form = described_class.new(correct_row)
    expect(form.valid?).to eq(true)
  end

  context 'invalid' do
    it 'menu_page_id: presence' do
      incorrect_row = FactoryGirl.attributes_for(:menu_item_import_row, menu_page_id: '')
      form = described_class.new(incorrect_row)
      expect(form.valid?).to eq(false)
      expect(form.errors[:menu_page_id]).to include("can't be blank")
    end

    it 'dish_id: presence' do
      incorrect_row = FactoryGirl.attributes_for(:menu_item_import_row, dish_id: '')
      form = described_class.new(incorrect_row)
      expect(form.valid?).to eq(false)
      expect(form.errors[:dish_id]).to include("can't be blank")
    end

    it 'menu_page_id: numericality' do
      incorrect_row = FactoryGirl.attributes_for(:menu_item_import_row, menu_page_id: 'a')
      form = described_class.new(incorrect_row)
      expect(form.valid?).to eq(false)
      expect(form.errors[:menu_page_id]).to include("is not a number")
    end

    it 'dish_id: numericality' do
      incorrect_row = FactoryGirl.attributes_for(:menu_item_import_row, dish_id: 'a')
      form = described_class.new(incorrect_row)
      expect(form.valid?).to eq(false)
      expect(form.errors[:dish_id]).to include("is not a number")
    end
  end
end
