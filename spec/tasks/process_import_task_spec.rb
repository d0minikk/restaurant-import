describe ProcessImportTask do
  it 'process' do
    import_task = FactoryGirl.create(:import_task, importer_type: 'Dishes')

    allow_any_instance_of(DishesImporter).to receive(:import).and_return(:success)

    described_class.new(import_task.id).process

    expect(import_task.reload.status).to eq('success')
    expect(import_task.finished_processing_at).to be_within(5.second).of Time.zone.now
  end
end
