class OokamiletterController < ApplicationController
  
  before_action :require_user_logged_in
  #ログインしていない場合はトップページへ
  
  def show
    @answerletter = Postletter.find(params[:id])
    #checkとtimercheckにtrueが入っているインスタンスになっている
  end
  
end
