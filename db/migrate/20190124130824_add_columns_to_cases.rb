class AddColumnsToCases < ActiveRecord::Migration[5.2]
  def change
    add_column :cases, :title, :string
    add_column :cases, :verifierPreference, :string
    add_column :cases, :name, :string
    add_column :cases, :contact, :string
    add_column :cases, :address, :text
    add_column :cases, :cnic, :string
  end
end
