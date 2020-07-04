class UsersController < ApplicationController
    before_action :logged_in?, only: [:new, :create, :edit, :update]
  
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        display_avatar(@user.id)
       
       if @user.save
        session[:user_id] = @user.id
        redirect_to root_path
       else
         flash[:warning] = "Some thing went wrong."
         render 'new'
       end
    end
    
    def show 
        @user = User.find_by(id: params[:id])
    end

    def edit
      #  @user = current_user
       @user = User.find(params[:id])
     
    end
  
    def update
        @user = User.find(params[:id])
  
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

    end

    def user_params
        params.require(:user).permit(:user_name, :password, :first_name, :last_name, :email, :avatar)
    end

  

end
