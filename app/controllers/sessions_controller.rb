class SessionsController < ApplicationController
  def new
     @userlogin=User.find(params[:id])
  end

  def create
    name = params[:session][:name]
    password = params[:session][:password]
    if login(name, password)
      
      redirect_to root_url
      #ログインに成功したらトップページへ飛ぶ
      
    else
      #フラッシュメッセージを表示させない
      render 'new'
      
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
  
  private

  def login(name, password)
    #同じ名前を禁止しているのでアカウントは重複しない
    @user = User.find_by(name: name)
    if @user && @user.authenticate(password)
      # ログイン成功
      session[:user_id] = @user.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
  
end
