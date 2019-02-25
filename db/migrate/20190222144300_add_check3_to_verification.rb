class AddCheck3ToVerification < ActiveRecord::Migration[5.2]
  def change
    add_column :verifications, :check3, :boolean
  end
end
