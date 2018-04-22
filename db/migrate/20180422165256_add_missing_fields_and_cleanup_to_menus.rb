class AddMissingFieldsAndCleanupToMenus < ActiveRecord::Migration[5.1]
  def change
    add_column :menus, :physical_description, :string
    add_column :menus, :date, :datetime
    add_column :menus, :status, :string
    add_column :menus, :page_count, :integer
    add_column :menus, :dish_count, :integer
    add_column :menus, :currency, :string
    add_column :menus, :currency_symbol, :string

    rename_table :ocassions, :occasions
    add_column :menus, :occasion_id, :integer

    add_column :locations, :location_type, :string
  end
end
