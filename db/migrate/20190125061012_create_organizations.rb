class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :title
      t.string :admin_email

      t.timestamps
    end
  end
end
