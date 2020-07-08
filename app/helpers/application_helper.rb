module ApplicationHelper
    def logged_in?
        !!session[:user_id]
    end

    
    def current_user
      @current_user ||= User.find_by_id(session[:user_id])  if  !!session[:user_id]
    end

    def is_admin?
      if logged_in?
        current_user.role == 1 
      end
    end

    def pluralize (count, noun, text = nil)
      if count != 0
        count == 1 ? "#{noun}#{text}" : "#{noun.pluralize}#{text}"
      end
    end

    def display_avatar(user_id)
      user = User.find_by_id(user_id)
      if !user.avatar.attached?
        random = rand(1..9)
        user.avatar.attach(io: File.open(Rails.root.join('public','images','avatars',"#{random}"'.jpg')), filename: "#{random}"'.jpg', content_type: 'image/jpg')
      end
    end
  
    def flash_warning(text="Something went wrong.")
      flash[:warning] = "#{text}"
    end
 
end
