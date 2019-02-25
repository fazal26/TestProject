class AddAmountToVerification < ActiveRecord::Migration[5.2]
  def change
    add_column :verifications, :amount, :integer
  end
end
