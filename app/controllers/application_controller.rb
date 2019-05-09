class ApplicationController < ActionController::Base
    
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  private
  
  #このメソッドを呼び起こすことでログインしていない場合トップページ戻す処理
  def require_user_logged_in
    unless logged_in?
      redirect_to root_url
    end
  end
  
  def require_use_show
    unless logged_in?
      redirect_to controller: 'users', action: 'show'
    end
  end
  
end
