class TruthsController < ApplicationController
  
  
  def index
    
  end
  
  def show
    
    if logged_in?
      @postletter=current_user.postletters.build
    else
      @postletter=Postletter.new
    end
    
    @user2=User.find(params[:id])
  end
  
end
