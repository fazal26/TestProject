class CreateJoinTableUserCase < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :cases do |t|
      # t.index [:user_id, :case_id]
      # t.index [:case_id, :user_id]
    end
  end
end
