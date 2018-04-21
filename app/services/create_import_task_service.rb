class CreateImportTaskService
  def initialize(form)
    @form = form
  end

  def call
    return false unless @form.valid?

    ActiveRecord::Base.transaction do
      create_import_task
      process
    end
  rescue StandardError => error
    # TODO Call exceptions tracker
    return false
  end

  private

  def create_import_task
    @import_task = ImportTask.create!(@form.attributes)
  end

  def process
    ImportTaskJob.perform_later(@import_task.id)
  end
end
