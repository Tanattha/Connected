class PostsController < ApplicationController
  before_action :logged_in?
  skip_before_action :logged_in?, only: [:index, :show]
  
  def index
    if params[:filter].present? 
      @posts = Post.filter(params[:filter]).paginate(page: params[:page])
    else 
      @posts = Post.search(params[:search]).paginate(page: params[:page])
    end
   
  end
    
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post
    else
      flash_warning
      render 'new'
    end
  end
   
  def show 
    find_post
    @comment = @post.comments.new 
  end
  
  def edit
    if logged_in?
      find_post
      if current_user != find_post.user
        redirect_to root_path
        flash_warning("YOU CAN'T EDIT ON SOMEONE ELSE POST!")
      end
    else
      redirect_to root_path
      flash_warning("MUST LOGIN FIRST!")
    end
  end

  def update
    find_post
    if @post.update(post_params)
      redirect_to @post
    else
      flash_warning
      render 'edit'
    end
  end

  def destroy
    find_post
    if @post.comments
      @post.comments.destroy_all
    end
    @post.destroy
    redirect_to root_path
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :category_id, :user_id, :search)
  end
end
