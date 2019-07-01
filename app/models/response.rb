class Response < ApplicationRecord
  
  belongs_to :user
  belongs_to :fromuser, class_name: 'User'
  has_many :changeletters
  
end
