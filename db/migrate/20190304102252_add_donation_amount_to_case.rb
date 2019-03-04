class AddDonationAmountToCase < ActiveRecord::Migration[5.2]
  def change
    add_column :cases, :donation_amount, :integer
  end
end
