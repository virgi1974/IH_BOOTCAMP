require 'pry'
module ApplicationHelper
  def flash_message
    check_flash(:alert) || check_flash(:notice)
  end

  def created link_obj
    link_obj.created_at.strftime("%d-%m-%Y %H:%M")
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
