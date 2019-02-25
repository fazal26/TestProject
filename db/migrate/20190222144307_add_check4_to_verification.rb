class AddCheck4ToVerification < ActiveRecord::Migration[5.2]
  def change
    add_column :verifications, :check4, :boolean
  end
end
