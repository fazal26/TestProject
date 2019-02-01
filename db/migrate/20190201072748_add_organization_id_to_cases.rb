class AddOrganizationIdToCases < ActiveRecord::Migration[5.2]
  def change
    add_column :cases, :organization_id, :integer
  end
end
