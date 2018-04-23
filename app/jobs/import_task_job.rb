class ImportTaskJob < ActiveJob::Base
  queue_as :import

  def perform(import_task_id)
    ProcessImportTask.new(import_task_id).process
  end
end
