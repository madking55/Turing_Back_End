class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :cart, :current_user

  def cart
    @cart ||= Cart.new(session[:cart])
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end
end
