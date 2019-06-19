class Friend < ApplicationRecord
  belongs_to :user
  validates :sentence, presence: true, length: { maximum: 90 }
  validates :person,presence: true,length: { maximum: 15 }
  #sentenceの上限は90文字まで
  
end
