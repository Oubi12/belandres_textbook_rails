class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
    # @posts = @posts.where('title LIKE ?', "%#{params[:title]}%")
    # if params[:start_date].present? && params[:end_date].present?
    #   @posts = @posts.where(created_at: params[:start_date]..params[:end_date])
    # end
    # @posts = @posts.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new.(post_params)
    if @post.save
      flash[:notice] = 'Post created successfully'
      redirect_to posts_path
    else
      flash.now[:alert] = 'Post create failed'
      render :new, status: :unprocessable_entity
    end
  end
  def show
     @post = Post.find(params[:id])
  end
  def edit
    @post = Post.find(params[:id])
  end

  def update
    # @post = Post.update(params[:id])
    if @post.update(post_params)
      flash[:notice] = 'Post update successfully'
      redirect_to posts_path
    else
      flash.now[:alert] = 'Post update failed'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post deleted'
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :email,)
  end
end

