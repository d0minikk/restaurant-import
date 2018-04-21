class ImportTasksController < ApplicationController
  def index
    @import_tasks = ImportTask.all
  end

  def new
    @form = ImportTaskForm.new
  end

  def create
    @form = ImportTaskForm.new(import_task_params)
    service = CreateImportTaskService.new(@form)

    if service.call
      redirect_to import_tasks_path, notice: 'Import processing'
    else
      render :new
    end
  end

  private

  def import_task_params
    params.require(:import_task).permit(:file, :importer_type)
  end
end
