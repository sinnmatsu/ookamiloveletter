class Postletter < ApplicationRecord
  
  belongs_to :user
  belongs_to :fromuser, class_name: 'User'
  #fromuserはUserモデルを参照するという指定
  
  validates :text, presence: true
  validates :account, presence: true
  #textとaccountの空白を許さないバリデーション
  
  #thinkとrecom用のバリデーション
  validates :person, length: { maximum: 10 } 
  validates :person, presence: true
  
  validates :reason, length: { maximum: 80 } 
  validates :reason, presence: true
  
  
  
end
