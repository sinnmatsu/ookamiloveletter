module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    #今現在自分が開いているブラウザのsessionに入っているuser_idをfindする
  end

  def logged_in?
    !!current_user
    #ログインしていたらtrueを返す
  end
end
