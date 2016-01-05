require 'pry'
class User < ActiveRecord::Base

  has_many :products
  has_many :bids

  validates :email, uniqueness: true
  validates :email, presence: true

  def self.checkSelfBid(email_buyer,seller_id)
    @user = User.where('email == ?',email_buyer)[0]
    email_seller = User.find(seller_id).email
    if email_buyer == email_seller
      return false
    else
      @user
    end
  end

end
