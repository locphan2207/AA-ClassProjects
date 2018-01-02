class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end
  
  def create
    new_user = User.new(user_param)
    if new_user.save
      render json: new_user
    else
      render json: new_user.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def show
    user = User.find_by(id: params[:id])
    if user
      render json: user, status: :ok
    else 
      render plain: "Cannot find this user", status: 404
    end
  end
  
  def update
    user = User.find_by(id: params[:id])
    
    if user.update(user_param)
      render json: user
      # redirect_to '', status: 200
    else
      render jason: user.errors
    end
  end
  
  def destroy
    user = User.find_by(id: params[:id])
    if user
      user.destroy
      render plain: "Sucessful deleted. Here are all users left:"
      render json: User.all 
    else
      render plain: "Cannot delete nonexisting user!"
    end
  end
  
  private
  def user_param
    params.require(:user).permit(:username)
  end
end
