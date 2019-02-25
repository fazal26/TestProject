class AddCheck5ToVerification < ActiveRecord::Migration[5.2]
  def change
    add_column :verifications, :check5, :boolean
  end
end
