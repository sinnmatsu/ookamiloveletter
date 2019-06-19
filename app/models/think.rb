class Think < ApplicationRecord
  belongs_to :user
  belongs_to :fromuser, class_name: 'User'
  
  validates :person, length: { maximum: 10 } 
  validates :person, presence: true
  
end
