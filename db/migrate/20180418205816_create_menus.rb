class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.string :name
      t.text :notes
      t.string :call_number
      t.string :keywords
      t.string :language
      t.string :name

      t.references :sponsor
      t.references :event
      t.references :venue
      t.references :place
      t.references :location


      t.timestamps
    end
  end
end
