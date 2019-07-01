class Changeletter < ApplicationRecord
  
  #レスポンスキーを挿入することでどのchangeletterなのかを特定する
  belongs_to :user
  belongs_to :fromuser, class_name: 'User'
  
end
