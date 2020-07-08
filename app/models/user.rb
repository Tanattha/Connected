class User < ApplicationRecord
    has_secure_password
    has_many :posts
    has_many :comments, through: :posts
    has_one_attached :avatar

    
    has_many :messages

  
    validates_presence_of :email, :user_name
    validates_uniqueness_of :email, :user_name

    self.per_page = 15
 
end