class SubsController < ApplicationController
  before_action :require_login, only: [:new]

  before_action :require_mod, only: [:edit, :update, :destroy]

  def new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def index
  end

  def show
    @sub = Sub.find_by_id(params[:id])
  end

  def edit
    @sub = Sub.find_by_id(params[:id])
  end

  def update
    @sub = Sub.find_by_id(params[:id])
    if current_user.id == @sub.moderator.id
      if @sub.update(sub_params)
        redirect_to sub_url(@sub)
      else
        flash[:errors] = @sub.errors.full_messages
        render :edit
      end
    end
  end

  def destroy
    @sub = Sub.find(params[:id])
    @sub.destroy
    redirect_to subs_url
  end

  def current_sub
    @sub = Sub.find(params[:id])
  end

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
