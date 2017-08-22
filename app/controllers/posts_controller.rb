class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = if params[:term]
      Post.where('title LIKE?', "%#{params[:term]}%").order('id DESC')
    elsif params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.order('created_at DESC').page(params[:page]).per(3)
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = "Post successfully created."
      redirect_to @post
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id && @post.update(post_params)
      flash[:success] = "Post successfully updated."
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "Post successfully deleted."

    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :term, :tag_list)
    end
end
