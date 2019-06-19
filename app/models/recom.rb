class Recom < ApplicationRecord
  belongs_to :user
  belongs_to :fromuser, class_name: 'User'
  
  validates :person, length: { maximum: 10 } 
  validates :person, presence: true
  
  validates :reason, length: { maximum: 80 } 
  validates :reason, presence: true
  
  
end
