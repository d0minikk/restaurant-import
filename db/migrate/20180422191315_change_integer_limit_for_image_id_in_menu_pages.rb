class ChangeIntegerLimitForImageIdInMenuPages < ActiveRecord::Migration[5.1]
  def change
    change_column :menu_pages, :image_id, :integer, limit: 8
  end
end
