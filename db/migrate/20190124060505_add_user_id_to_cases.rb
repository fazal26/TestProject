class AddUserIdToCases < ActiveRecord::Migration[5.2]
  def change
    add_column :cases, :user_id, :integer, default: 0
  end
end
