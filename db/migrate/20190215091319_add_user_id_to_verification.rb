class AddUserIdToVerification < ActiveRecord::Migration[5.2]
  def change
    add_column :verifications, :user_id, :integer
  end
end
