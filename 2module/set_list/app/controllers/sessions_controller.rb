class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    # if user exists and is authenticated
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.username}"
      redirect_to :root
    else
      flash[:error] = "Sorry, your credentials are bad."
      redirect_to '/login'
    end
  end
end