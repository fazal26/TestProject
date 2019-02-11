class RemoveOrganizationIdFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :organization_id, :integer
  end
end
