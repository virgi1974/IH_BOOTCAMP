require 'pry'
class ProductsController < ApplicationController

  def list
    @products = Product.all
    render "list"
  end

  def index
    @user = User.find(params[:user_id])
    @products = @user.products.all
    render "index"
  end

  def show
    @user = User.find(params[:user_id])
    @product = @user.products.find(params[:id])

    @bids = Bid.where('product_id == ?', @product.id)
    @new_bid = Bid.new
    
    render "show"
  end

  def new
    @user = User.find(params[:user_id])
    @new_product = @user.products.new
    render "new"
  end

  def create
    @user = User.find(params[:user_id])
    @new_product = @user.products.new(strong_params)
    if @new_product.save
      flash[:notice] = "Product Added"
      redirect_to action: "show", controller: "products", id: @new_product.id
      #redirect_to user_path(@new_user.id)
    else
      flash[:alert] = "Problem with process"
      render "new"
    end    
  end

    def destroy
      
    end

  private

    def strong_params
      params.require(:product).permit(:title, :description, :deadline, :min_price)
    end
end
