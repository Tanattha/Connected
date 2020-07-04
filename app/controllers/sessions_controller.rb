class SessionsController < ApplicationController

 
  

    def create
        @user = User.find_by(user_name: params[:user_name])
        if !!@user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to root_path
        else
            flash[:warning] = "Invalid Username or Password."
            redirect_to login_path
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end


end