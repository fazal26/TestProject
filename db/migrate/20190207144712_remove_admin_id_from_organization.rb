class RemoveAdminIdFromOrganization < ActiveRecord::Migration[5.2]
  def change
    remove_column :organizations, :admin_id, :integer
  end
end
