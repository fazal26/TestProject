class AddDescToRoles < ActiveRecord::Migration[5.2]
  def change
    add_column :roles, :desc, :text
  end
end
