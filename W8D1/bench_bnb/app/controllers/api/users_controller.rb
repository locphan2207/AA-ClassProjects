class Api::UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
      # redirect_to links_url #maybe fix this
      render :show
    else
      flash.now[:errors] = @user.errors.full_messages
      # render plain: 'username already exists'
      render :show, status: 422
    end
  end

  private
  def user_params
    params.require(:user).permit(:password, :username)
  end
end
