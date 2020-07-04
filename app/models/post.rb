class Post < ApplicationRecord
    belongs_to :category
    belongs_to :user
    has_many :comments
    validates_presence_of :title

    #has_rich_text :body
   
end
