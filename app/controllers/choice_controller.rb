class ChoiceController < ApplicationController
  
  before_action :require_user_logged_in
  #ログインしていない場合はトップページへ
  
  def index
  end
  
  def show
    @user1=User.find(params[:id])
  end
end
