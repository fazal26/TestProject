class AddCommentableIdToVerification < ActiveRecord::Migration[5.2]
  def change
    add_column :verifications, :commentable_id, :integer
  end
end
