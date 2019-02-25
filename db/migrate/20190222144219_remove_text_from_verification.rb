class RemoveTextFromVerification < ActiveRecord::Migration[5.2]
  def change
    remove_column :verifications, :text, :string
  end
end
