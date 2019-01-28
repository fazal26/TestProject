class UsersRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :users_roles, :id => false do |t|
      t.integer :user_id
      t.integer :role_id
    end
  end
end
