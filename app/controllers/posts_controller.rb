class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.includes(:categories).all
    if params[:title].present?
      @posts = @posts.where('title LIKE ?', "%#{params[:title]}%")
    end

    if params[:start_date].present? && params[:end_date].present?
      @posts = @posts.where(created_at: params[:start_date]..params[:end_date])
    end

    if params[:published].present?
      @posts = @posts.where(published: true)
    end
    if params[:category].present?
      @posts = @posts.where(category: params[:name])
    end


    @posts = @posts.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:notice] = 'Post created successfully'
      redirect_to posts_path
    else
      flash.now[:alert] = 'Post create failed'
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update

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
    params.require(:post).permit(:title, :content, :published, category_ids: [])
  end

  def validate_post_owner
    return if @post.user == current_user

    flash[:notice] = 'This post does not belongs to you'
    redirect_to posts_path
  end
end

