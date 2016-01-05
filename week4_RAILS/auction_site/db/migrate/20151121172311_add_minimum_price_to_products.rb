class AddMinimumPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :min_price, :integer
  end
end
