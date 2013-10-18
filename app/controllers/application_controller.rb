class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def signed_in?
  	if session[:email] && session[:password]
  		true
  	else
  		false
  	end
  end
  helper_method :signed_in?

end
