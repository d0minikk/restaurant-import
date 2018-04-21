class CreateOcassions < ActiveRecord::Migration[5.1]
  def change
    create_table :ocassions do |t|
      t.string :name

      t.timestamps
    end
  end
end
