class User < ApplicationRecord
  #has_secure_passwordで認証メソッドが提供されているので、nameやemailを打ち込むことでそのアカウントを取得することができる。
  has_secure_password
  validates :name, presence: true, length: { maximum: 50 }
  validates :name, uniqueness: { case_sensitive: false }
  #nameは空白を許さず、同じ名前も禁止する
  
  #emailは設定してもしなくてもどっちでも良い状態
  
  
  has_many :postletters ,foreign_key: 'fromuser_id'
  #fromuserから見た中間テーブル
  has_many :reverses_of_postletters, class_name: 'Postletter',foreign_key: 'user_id'
  #touserから見た時の中間テーブル
  has_many :takeusers, through: :postletters, source: :user
  #postlettersを通して受け取ったuserを取得するメソッド
  has_many :giveusers, through: :reverses_of_postletters, source: :fromuser
  #reverses_of_postlettersを通して送り主のuserを取得するメソッド
  has_many :givetexts, through: :postletters, source: :text
  #letterの送り主のtextを取得する
  has_many :taketexts, through: :reverses_of_postletters, source: :text
  #letterの受け取り主のtextを取得する
  has_many :takewhich, through: :reverses_of_postletters, source: :which
  #受け取り主として自分のアカウントが入っている中間モデルのwhichを取得するメソッド
                    
end
