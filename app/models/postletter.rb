class Postletter < ApplicationRecord
  
  belongs_to :user
  belongs_to :fromuser, class_name: 'User'
  #fromuserはUserモデルを参照するという指定
  
  validates :text, presence: true
  validates :account, presence: true
  #textとaccountの空白を許さないバリデーション
end
