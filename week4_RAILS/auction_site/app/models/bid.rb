class Bid < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  def  self.checkMinimumPrice(seller_id,product_id,bid)

    minimum_price_product = Product.where('user_id = ?', seller_id).where('id = ?', product_id)[0].min_price
    current_maximum_bid = Bid.where('product_id == ?',product_id).maximum(:amount) || 0

      if (current_maximum_bid < bid.to_i && bid.to_i > minimum_price_product) 
        true
      else
        false
      end
  end

end
