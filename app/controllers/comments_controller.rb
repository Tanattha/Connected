class CommentsController < ApplicationController
  before_action :logged_in?
  skip_before_action :logged_in?, :only => [:index, :show]
  

  def index
    redirect_to root_path
    flash_warning("Sorry, page not found.")
  end
 
  def new 
    @comment = Comment.new
  end
  

  def create
    @comment = Comment.create(comment_params)
    @comment.user = current_user
    if !@comment.save
      flash_warning
    end    
      redirect_to post_path(@comment.post)
  end

    def edit
    @comment = Comment.find_by(id: params[:id])
  end

  def show 
    find_comment
  end

  def update
    find_comment
    if !@comment.update(comment_params)
      flash_warning
    end
    redirect_to post_path(@comment.post)
  end

 
  def destroy
    find_comment
    @post = @comment.post
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
   params.require(:comment).permit(:body, :user_id, :post_id)
  end

end


