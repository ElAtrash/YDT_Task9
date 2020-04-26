class User < ActiveRecord::Base
  validates :login, :type, :email, presence: true  
end