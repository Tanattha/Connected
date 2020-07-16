class CategoriesController < ApplicationController
  before_action :is_admin?, only: [:new, :create, :edit, :update]
    
  def index
    redirect_to root_path
    flash_warning("Sorry, page not found.")
  end

  def new 
      @category = Category.new
  end
    
  def edit 
      @category = Category.find_by(id: params[:id])
  end

  def create
    @category = Category.new(category_params)
      if @category.save
        redirect_to posts_path
      else
        flash_warning
        render 'new'
      end
    end

  def update 
    if @category.update(category_params)
      redirect_to @category
    else
      flash_warning
      render 'edit'
      end
  end

  def show
    @category = Category.find_by(id: params[:id])
    @category_posts = @category.posts.paginate(page: params[:page], per_page: 10).order('created_at DESC') 
  end
    
  private

  def category_params
    params.require(:category).permit(:name)
  end

end