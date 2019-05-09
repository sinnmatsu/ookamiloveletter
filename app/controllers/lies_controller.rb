class LiesController < ApplicationController
  
  before_action :require_user_logged_in
  #ログインしていない場合はトップページへ
  
  def index
    
  end
  
  def show
    @postletter=current_user.postletters.build
    #postlettersメソッドはformuserと中間テーブルが関連ずけされている。
    @user2=User.find(params[:id])
  end
end
