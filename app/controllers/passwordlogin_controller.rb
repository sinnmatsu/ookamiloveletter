class PasswordloginController < ApplicationController
  def new
  end

  def create
    name = params[:session][:name]
    password = params[:session][:password]
    
    if login(name, password)
      redirect_to edit_user_path(@user)
      #編集画面に遷移する
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      redirect_to passwordlogin_path
    end
    
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
      return false
    end
  end
  
end
