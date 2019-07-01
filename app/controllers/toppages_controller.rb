class ToppagesController < ApplicationController
  def index
    
    
    
    #ログインして初めて受け取る
    if logged_in?
    #フラグ
    @myuser=current_user
    @responses = Response.where(fromuser_id: current_user.id).order(id: "DESC")+Response.where(user_id: current_user.id).order(id: "DESC")
    @responses.each do |responses|
      @responsess = responses
    end
    
    @postletters = current_user.reverses_of_postletters.order('created_at DESC')
    #自分が受け取り主から見たときの中間テーブル
    @postletters.each do |postletter|
      @postletterss=postletter
    end
      
    end
  end
end
