class Secret < ApplicationRecord
  
  belongs_to :user
  
  validates :secrettext, presence: true
  #必ずtextを投稿させるようにする
end
