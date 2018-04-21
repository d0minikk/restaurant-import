class CreateMenuItems < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_items do |t|
      t.decimal :price, precision: 8, scale: 3
      t.decimal :high_price, precision: 8, scale: 3
      t.decimal :xpos, precision: 8, scale: 3
      t.decimal :ypos, precision: 8, scale: 3

      t.references :menu_page
      t.references :dish

      t.timestamps
    end
  end
end
