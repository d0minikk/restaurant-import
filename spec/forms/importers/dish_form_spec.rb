describe Importers::DishForm do
  it 'valid' do
    correct_row = '1;fish;cool;1;2;2016;2018;10;15'
    form = described_class.new(correct_row)
    expect(form.valid?).to eq(true)
  end

  context 'invalid' do
    it 'id: presence' do
      incorrect_row = ';fish;cool;1;2;2016;2018;10;15'
      form = described_class.new(incorrect_row)
      expect(form.valid?).to eq(false)
      expect(form.errors[:id]).to include("can't be blank")
    end

    it 'name: presence' do
      incorrect_row = '1;;cool;1;2;2016;2018;10;15'
      form = described_class.new(incorrect_row)
      expect(form.valid?).to eq(false)
      expect(form.errors[:name]).to include("can't be blank")
    end

    it 'id: numericality' do
      incorrect_row = 'a;fish;cool;1;2;2016;2018;10;15'
      form = described_class.new(incorrect_row)
      expect(form.valid?).to eq(false)
      expect(form.errors[:id]).to include("is not a number")
    end
  end
end
