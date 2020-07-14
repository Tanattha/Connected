class ApplicationController < ActionController::Base
   
    include ApplicationHelper
    add_flash_types :success, :info, :warning, :danger
end
