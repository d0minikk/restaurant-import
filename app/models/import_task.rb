class ImportTask < ApplicationRecord
  enum status: [:processing, :failure, :success]

  mount_uploader :file, ImportTaskUploader
  mount_uploader :log, ImportTaskUploader

  def importer_class
    "#{importer_type}Importer".constantize
  end
end
