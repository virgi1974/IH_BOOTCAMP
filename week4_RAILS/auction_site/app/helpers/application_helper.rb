module ApplicationHelper

  def flash_message
    check_flash(:alert) || check_flash(:notice)
  end

  def check_deadline product
    if product.deadline < Time.now
      false
    end
  end

  def highest_bid product
    product.bids.max.amount.to_s 
  end

  private
  def check_flash type
    content_tag :div, class: type do
      content_tag :p do
        flash[type]
      end
    end
  end

end
