class UsersController < ApplicationController
    before_action :logged_in?
    skip_before_action :logged_in?, only: [:show]
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        
       if @user.save
        session[:user_id] = @user.id
        display_avatar(@user.id)
        redirect_to root_path
       else
         flash_warning
         render 'new'
       end
    end
    
    def show 
        @user = User.find_by(id: params[:id])
        @user_post = @user.posts.paginate(page: params[:page])
        @conversations = Conversation.all
    end

    def edit
        find_user
    end
  
    def update
        find_user
        if @user.update(user_params)
            redirect_to @user
        else
            render 'edit'
        end
    end

    def destroy 
    end

    private
    def find_user
        @user = User.find(params[:id])
        
    end

    def user_params
        params.require(:user).permit(:user_name, :password, :first_name, :last_name, :email, :avatar)
    end


end
