FactoryGirl.define do
  factory :import_task, class: ImportTask do
    file { Rack::Test::UploadedFile.new(File.open("#{Rails.root}/spec/fixtures/files/sample.csv")) }
    importer_type 'Dish'
  end
end
