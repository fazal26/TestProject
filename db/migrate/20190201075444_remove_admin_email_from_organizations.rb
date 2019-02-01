class RemoveAdminEmailFromOrganizations < ActiveRecord::Migration[5.2]
  def change
    remove_column :organizations, :admin_email, :string
  end
end
