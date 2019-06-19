class TakelettersController < ApplicationController
  #自分の「letter受け取る画面」にアクセスした時
  
  before_action :require_user_logged_in
  #ログインしていない場合はトップページへ
  
  
  def index
    @receiveletters = Postletter.where(user_id: current_user.id).order(id: "DESC")
  end
  
  def show
    @receiveletter = Postletter.find(params[:id])
    #クリックした通知のpostletterをparamsメソッドが受け取って、その中からfindする
  end
  
  def edit
    @receiveletter = Postletter.find(params[:id])
    #クリックした通知のpostletterをparamsメソッドで受け取って、その中からfindする
  end
  
  def update
    #パラメーター値に更新する値を代入している
    @receiveletter = Postletter.find(params[:id])
    @receiveletter.check = "true"
    #現在時刻をここに代入する
    if @receiveletter.updata
      flash[:success] = 'letterを受け取りました'
      render 'truthorlie/show'
    else
      flash.now[:danger] = 'letterを受け取ることができませんでした'
      render 'takeletters/index'
    end
  end
end
