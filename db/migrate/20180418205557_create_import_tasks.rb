class CreateImportTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :import_tasks do |t|
      t.string :importer_type, null: false
      t.string :file
      t.string :log
      t.integer :status, default: ImportTask.statuses[:processing]

      t.timestamps
    end
  end
end
