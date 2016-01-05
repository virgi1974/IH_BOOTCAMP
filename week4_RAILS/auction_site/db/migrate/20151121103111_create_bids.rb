class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.references :product, index: true
      t.integer  "product_id"
      t.timestamps
    end
  end
end
