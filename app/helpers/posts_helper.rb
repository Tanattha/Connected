module PostsHelper
    def page_nav
       self.paginate(page: params[:page], per_page: 10).order('created_at DESC') 
    end
end