class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #method to manage-render the error
  def render_404(params)
    Rails.logger.warn("Tried to access #{params} whicj did not exist.")
    render "layouts/404"
  end
end
