class ToletterController < ApplicationController
  
  def index
    
  end
  
  def show
     @response=Response.find(params[:id])
     #今回のレスポンスキー
     @user=User.find(@response.user.id)
     #送り相手のuser
    
     
     @changeletters=current_user.changeletters.build
     #fromuserに自分のuser_idを代入する
  end
end
