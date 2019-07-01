class LookletterController < ApplicationController
  
  def show
     @user=User.find(params[:id])
     #送り相手のuser
     @responses=current_user.responses.build
     
     @response = Response.where(fromuser_id: current_user.id, user_id: @user.id).first
     #この人とレスポンスキーを作っているかどうかを把握する
     
     
     unless @response
       @response = Response.where(fromuser_id: @user.id, user_id: current_user.id).first
       #相手からレスポンスキーを作成された場合
       unless @response
         #空だったら何もしない
       else
         @changeletters = Changeletter.where(response_id: @response.id).order(id: "DESC")
       end
         
       
     else 
       @changeletters = Changeletter.where(response_id: @response.id).order(id: "DESC")
       #その人とのレスポンスキーがある文通を全て取得する
     end
     
     
  end
  
end
