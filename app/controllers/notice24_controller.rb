class Notice24Controller < ApplicationController
  def show
    
    if logged_in?
      @postletter=current_user.postletters.build
    else
      @postletter=Postletter.new
    end
    
    @user=User.find(params[:id])
    
  end
end
