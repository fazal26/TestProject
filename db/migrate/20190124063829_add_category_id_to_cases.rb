class AddCategoryIdToCases < ActiveRecord::Migration[5.2]
  def change
    add_column :cases, :category_id, :integer
  end
end
