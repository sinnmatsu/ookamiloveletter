class UsersController < ApplicationController
  
  
  def index
    @users = User.all.page(params[:page])
  end

  def show
    
    #友達のアカウントにログインしたのと同時にtouserカラムにその友達のアカウントを設置する
    @user=User.find(params[:id])
    @myuser=current_user
    
  end

  def new
    @user=User.new
    #userモデルのインスタンスを組み立てる
    
  end

  #userのcreateメソッドで登録とログインを同時に完了する
  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      #登録完了と同時にユーザーをsessionの中に代入して、ログイン状態を維持する
      redirect_to root_url

    else
      render :new
    end
    
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :loginshow_id)
    #nameとemailとencrypted_passwordしかparamsに入れない
  end
  
  
end
