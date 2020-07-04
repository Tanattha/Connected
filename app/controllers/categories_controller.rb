class CategoriesController < ApplicationController

    def show
       @category = Category.find_by(id: params[:id])
       @category_posts = @category.posts.paginate(page: params[:page], per_page: 10).order('created_at DESC') 
    end
end