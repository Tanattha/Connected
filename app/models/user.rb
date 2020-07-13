class User < ApplicationRecord
    has_secure_password
    has_many :posts
    has_many :comments, through: :posts
    has_many :messages
    has_many :conversations, through: :messages

    has_one_attached :avatar
    validates_presence_of :email, :user_name
    validates_uniqueness_of :email, :user_name
    self.per_page = 15
 
end