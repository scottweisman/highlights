class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def signed_in?
  	session[:email] && session[:password]
  end
  helper_method :signed_in?

end