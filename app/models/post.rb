class Post < ApplicationRecord
    belongs_to :category
    belongs_to :user
    has_many :comments, dependent: :destroy
    validates_presence_of :title
   
    self.per_page = 10;

    def self.search(search)
        if search
         self.where("title like ?", "%#{search}%").order('created_at DESC')
        else
          self.all.order('created_at DESC')
        end
    end

    def self.filter(filter)
        if filter == 'most_comments'
          self.joins(:comments).group('posts.id').order('COUNT(comments.id) desc')
        elsif filter == 'no_comment'
          self.left_outer_joins(:comments).where(comments: {post_id: nil}).order('created_at desc')
        end
      end
end
