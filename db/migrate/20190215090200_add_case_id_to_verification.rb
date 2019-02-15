class AddCaseIdToVerification < ActiveRecord::Migration[5.2]
  def change
    add_column :verifications, :case_id, :integer
  end
end
