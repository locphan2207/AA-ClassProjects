class SessionsController < ApplicationController
  # before_action :require_login, only: [:destroy]
  
  def new
    render :new
  end
  
  def create 
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if user 
      session[:session_token] = user.reset_session_token!
      redirect_to bands_url
      # redirect_back(fallback_location: bands_url)
    else 
      flash.now[:errors] = ["Wrong username/password"]
      render :new
    end
  end 
  
  def destroy
    current_user.reset_session_token! 
    session[:session_token] = nil
    redirect_to new_session_url
    # render
  end
  
  # private 
  # def require_login
  #   redirect_to new_session_url unless current_user
  # end
end
