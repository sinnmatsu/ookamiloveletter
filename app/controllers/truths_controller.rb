class TruthsController < ApplicationController
  
  before_action :require_user_logged_in
  #ログインしていない場合はトップページへ
  
  def index
    
  end
  
  def show
    @postletter=current_user.postletters.build
    @user2=User.find(params[:id])
  end
end
