class Api::SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    @errors = []
    if @user
      session[:session_token] = @user.reset_session_token!
      render :show
    else
      @errors = ['Invalid credentials']
      render :show, status: 401
    end
  end

  def destroy
    render plain: "No current user", status: 404 if !current_user
    session[:session_token] = nil
    render json: {} if current_user
  end

end
