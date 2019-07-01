class ReplyController < ApplicationController
  def index
  end

  def show
     @changeletterfrom=Changeletter.find(params[:id])
     #前回のchangeletterを取得する
     @user=User.find(@changeletterfrom.fromuser.id)
     #送ってきた人のuserを取得する
    
     
     @changeletter=current_user.changeletters.build
     #fromuserに自分のuser_idを代入する
  end
end
