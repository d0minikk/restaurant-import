class ProcessImportTask
  def initialize(import_task_id)
    @import_task = ImportTask.find(import_task_id)
    @importer = @import_task.importer_class.new(@import_task)
  end

  def process
    result = @importer.import
    @import_task.update_column(:status, result)
    @import_task.update_column(:finished_processing_at, Time.zone.now)
  end
end
