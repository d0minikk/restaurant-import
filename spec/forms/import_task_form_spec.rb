describe ImportTaskForm do
  it 'valid' do
    file = Rack::Test::UploadedFile.new(File.open("#{Rails.root}/spec/fixtures/files/sample.csv"))
    params = { file: file, importer_type: 'Dishes' }

    form = described_class.new(params)

    expect(form.valid?).to eq(true)
    expect(form.importer_type).to eq('Dishes')
  end

  context 'invalid' do
    it 'file: present' do
      params = { file: '', importer_type: 'Dishes' }

      form = described_class.new(params)

      expect(form.valid?).to eq(false)
      expect(form.errors[:file]).to include("can't be blank")
    end

    it 'importer_type: present' do
      params = { file: '', importer_type: '' }

      form = described_class.new(params)

      expect(form.valid?).to eq(false)
      expect(form.errors[:importer_type]).to include("can't be blank")
    end

    it 'file: must be csv' do
      file = Rack::Test::UploadedFile.new(File.open("#{Rails.root}/spec/fixtures/files/empty.txt"))
      params = { file: file, importer_type: 'Dishes'}

      form = described_class.new(params)

      expect(form.valid?).to eq(false)
      expect(form.errors[:file]).to include('invalid format. Only CSV type allowed.')
    end

    it 'file: wrong delimiter' do
      file = Rack::Test::UploadedFile.new(File.open("#{Rails.root}/spec/fixtures/files/wrong_delimiter.csv"))
      params = { file: file, importer_type: 'Dishes' }

      form = described_class.new(params)

      expect(form.valid?).to eq(false)
      expect(form.errors[:file]).to include('invalid format. Wrong delimiter in file.')
    end
  end
end
