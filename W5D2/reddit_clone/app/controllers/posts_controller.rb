class PostsController < ApplicationController
  def new
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    post.sub_id = 1
    if post.save
      redirect_to post_url(post)
    else
      flash.now[:errors] = post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    @post = Post.find_by_id(params[:id])
    if current_user.id == @post.user_id
      if @post.update(post_params)
        redirect_to post_url(@post)
      else
        flash.now[:errors] = @post.errors.full_messages
        render :edit
      end
    end
  end
  #
  # def destroy
  #   @post = Post.find_by_id(params[:id])
  #   @post.destroy
  # end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end
