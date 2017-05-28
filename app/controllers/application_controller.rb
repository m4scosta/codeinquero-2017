class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(cookies.signed[:id]) if cookies.signed[:id]
  end
  helper_method :current_user

  protected

  def authorize
    redirect_to root_path if (current_user.blank? && request.path != root_path)
  end
end
