class AddUserIdToBids < ActiveRecord::Migration
  def change
    add_column :bids, :user_id, :integer
    add_column :bids, :amount, :integer
  end
end
