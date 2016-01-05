module ApplicationHelper

  def flash_message
    check_flash(:alert) || check_flash(:notice)
    # if flash[:alert]
    #   check_flash "alert"
    # elsif flash[:notice]
    #   check_flash "notice"
    # end
  end

  def show_total_hours project_obj
      project_obj.total_hours_in_month(Date.current.month,Date.current.year).round(2)
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
