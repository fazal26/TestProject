class AddCommentableTypeToVerification < ActiveRecord::Migration[5.2]
  def change
    add_column :verifications, :commentable_type, :string
  end
end
