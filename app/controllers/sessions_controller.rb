class SessionsController < ApplicationController
  def new
  end

  def create
	  session[:email] = params[:email]
	  session[:password] = params[:password]
	  redirect_to books_path
  end

  def destroy
  	session[:email] = nil
  	session[:password] = nil
  	redirect_to root_url, notice: "Logged out!"
  end
end
