class Postletter < ApplicationRecord
  belongs_to :user
  belongs_to :fromuser, class_name: 'User'
  #fromuserはUserモデルを参照するという指定
  
  validates :text, presence: true
  #textの空白を許さないバリデーション
end
