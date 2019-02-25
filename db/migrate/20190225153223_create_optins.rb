class CreateOptins < ActiveRecord::Migration[5.2]
  def change
    create_table :optins do |t|
      t.integer :user_id
      t.integer :case_id
      
      t.timestamps
      
    end
  end
end
