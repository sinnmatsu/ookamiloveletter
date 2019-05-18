class LiesController < ApplicationController
  
 
  def index
    
  end
  
  def show
    
    if logged_in?
      #ログインしていた場合
      @postletter=current_user.postletters.build
    else
      #ログインしていなかった場合
      @postletter=Postletter.new
    end
    
    @user2=User.find(params[:id])
    
  end
end
