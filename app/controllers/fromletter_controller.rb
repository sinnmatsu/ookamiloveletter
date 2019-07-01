class FromletterController < ApplicationController
  
  def show
    #相手からレスポンスキーを作成して、自分が最初にletterを送る場合-->
    @response=Response.find(params[:id])
     #今回のレスポンスキー
     @user=User.find(@response.fromuser.id)
     #送り相手のuser
    
     
     @changeletters=current_user.changeletters.build
     #fromuserに自分のuser_idを代入する
  end
  
end
