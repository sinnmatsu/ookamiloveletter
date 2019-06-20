class UsersController < ApplicationController
  
  
  def index
    @users = User.all.page(params[:page])
  end

  def show
    
    #リンクが見当たらないエラーを防ぐ
    @user=User.find(params[:id])

  end

  def new
    @user=User.new
    #フラグ
  end
  

  def create
    @user = User.new(user_params)
    
    if @user.save
      
      session[:user_id] = @user.id
      redirect_to ask_index_path
      
    else
      render :new
    end
    
  end
  
  def edit
    @user=User.find(params[:id])
    #ログインしてきたユーザーを捉える
  end
  
  
  def update
    
    @user = User.find(params[:id])
    #パスワードを変更するユーザーを捉える
    
    if current_user == @user
      #ログインしているuserと合致
      
      if @user.update(user_params)
        #パスワード完了画面に飛ぶ
        redirect_to passfinish_index_path
      else
        flash.now[:danger] = 'パスワードを変更に失敗しました'
        redirect_to edit_user_path(@user)
      end   
      
    else
      
    end
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :password)
    #nameとemailとencrypted_passwordしかparamsに入れない
  end
  
  
end
