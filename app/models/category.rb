class Category < ApplicationRecord
  has_many :posts
  validates_presence_of :name

 # self.posts.per_page = 2
end