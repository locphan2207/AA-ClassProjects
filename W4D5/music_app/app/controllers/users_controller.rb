class UsersController < ApplicationController
  def new
    render :new
  end
  
  def create
    user = User.new(user_params)
    # fail
    if user.save 
      #logging in:
      session[:session_token] = user.session_token
      # redirect_to 
      render plain: "You have logged in"
    else 
      flash.now[:errors] = ["cannot sign up"] #user.errors.full_messages
      render :new
    end
  end
  
  private 
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
