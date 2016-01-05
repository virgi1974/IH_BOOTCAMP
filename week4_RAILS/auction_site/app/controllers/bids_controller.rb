require 'pry'
class BidsController < ApplicationController

  def create
    seller_id = params[:user_id]
    product_id = params[:product_id]
    amount = params[:user][:bid]
    email = params[:user][:email] #email to check
    @user = User.checkSelfBid(email,seller_id) #false or hte user doing the bid  

    if Bid.checkMinimumPrice(seller_id,product_id,amount) == false
      flash[:alert] = 'The bid doesn`t reach the minimum price'
      redirect_to action: "show", controller: "products", user_id: seller_id, id: product_id
    elsif @user == false
      flash[:alert] = 'the seller can´t make a bid for his own item'
      redirect_to action: "show", controller: "products", user_id: seller_id, id: product_id
    else
      new_bid = Bid.new(user_id: @user.id, product_id: product_id, amount: amount)
      new_bid.save
      flash[:notice] = 'bid has been added!'
      redirect_to action: "show", controller: "products", user_id: seller_id, id: product_id, email: email
    end
  end

  private
    def strong_params
      params.require(:bid).permit(:product_id, :amount, :user_id)
    end

end
