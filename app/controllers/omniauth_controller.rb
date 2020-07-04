class OmniauthController < ApplicationController
    def create
        @user = User.find_or_create_by(email: auth['info']['email']) do |u|
            u.user_name = auth['info']['name']
            u.password = auth['uid']
            u.email = auth['info']['email']
           
          end
          display_avatar(@user.id)
         session[:user_id] = @user.id
        
        redirect_to root_path
    end


private
     
def auth
    request.env['omniauth.auth']
  end
end