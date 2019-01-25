class AddStatusToCases < ActiveRecord::Migration[5.2]
  def change
    add_column :cases, :status, :integer, default: 0, null: false
  end
end
