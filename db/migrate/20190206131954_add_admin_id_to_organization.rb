class AddAdminIdToOrganization < ActiveRecord::Migration[5.2]
  def change
    add_column :organizations, :admin_id, :integer
  end
end
