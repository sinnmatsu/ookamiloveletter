class TruthorlieController < ApplicationController
  
  before_action :require_user_logged_in
  #ログインしていない場合はトップページへ
  
  def index
  end

  def show
    @receiveletter = Postletter.find(params[:id])
    #updataアクションからこのshowアクションが反応する
  end
  
  def edit
    @receiveletter = Postletter.find(params[:id])
    #特定しているreceiveletterを受け取る
  end
end
