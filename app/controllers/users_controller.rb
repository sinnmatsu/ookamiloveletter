class UsersController < ApplicationController
  
  
  def index
    @users = User.all.page(params[:page])
  end

  def show
    #友達のアカウントにログインしたのと同時にtouserカラムにその友達のアカウントを設置する
    @user=User.find(params[:id])
    
  end

  def new
    @user=User.new
    #userモデルのインスタンスを組み立てる
    
    @userlogin=User.find(params[:id])
     #idが0の場合はトップページへと移動させる
  end

  #userのcreateメソッドで登録とログインを同時に完了する
  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      #登録完了と同時にユーザーをsessionの中に代入して、ログイン状態を維持する
      
      if @user.loginshow_id == 1
        #0だった場合はトップページへ
        redirect_to root_url
      else
        #0以外の場合はその人のページへと飛ぶ
        redirect_to user_path(@user.loginshow_id)
      end

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
