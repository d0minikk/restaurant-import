describe CreateImportTaskService do
  it 'create ImportTask' do
    file = Rack::Test::UploadedFile.new(File.open("#{Rails.root}/spec/fixtures/files/sample.csv"))
    form = double(
      valid?: true,
      attributes: {
        file: file,
        importer_type: 'Dishes'
      }
    )
    allow(ImportTaskJob).to receive(:perform_later).and_return(true)

    service = described_class.new(form)
    expect{ service.call }.to change(ImportTask, :count).by(1)
  end
end
