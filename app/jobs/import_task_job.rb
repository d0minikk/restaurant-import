class ImportTaskJob < ActiveJob::Base
  queue_as :import

  def perform(import_task_id)
    # TODO call importer
  end
end
