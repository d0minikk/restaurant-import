class ImportTask < ApplicationRecord
  enum status: [:processing, :failure, :success]

  mount_uploader :file, ImportTaskUploader
  mount_uploader :log, ImportTaskUploader
end
