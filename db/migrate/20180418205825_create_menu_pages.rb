class CreateMenuPages < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_pages do |t|
      t.integer :page_number
      t.integer :full_height
      t.integer :full_width
      t.integer :image_id

      t.string :uuid

      t.references :menu

      t.timestamps
    end
  end
end
