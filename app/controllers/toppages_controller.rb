class ToppagesController < ApplicationController
  def index
    
    
    
    #ログインして初めて受け取る
    if logged_in?
    
    @myuser=current_user
    @postletters = current_user.reverses_of_postletters.order('created_at DESC')
    #自分が受け取り主から見たときの中間テーブル
    @mysecret=Secret.where(user_id: current_user.id).first
    #user_idに自分のuser_idが入っているsecretを1つ取得する
      
    end
  end
end
