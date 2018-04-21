class AddFinishedProcessingAtToImportTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :import_tasks, :finished_processing_at, :datetime
  end
end
