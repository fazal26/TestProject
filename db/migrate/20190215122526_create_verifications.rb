class CreateVerifications < ActiveRecord::Migration[5.2]
  def change
    create_table :verifications do |t|
      t.boolean :check1
      t.boolean :check2
      t.string :remarks
      t.string :text
      t.integer :case_id
      t.integer :user_id

      t.timestamps
    end
  end
end
