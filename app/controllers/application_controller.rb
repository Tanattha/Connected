class ApplicationController < ActionController::Base
   
    include ApplicationHelper
    include LetterAvatar::AvatarHelper
    add_flash_types :success, :info, :warning, :danfer
end
