class ThinksController < ApplicationController
  
  #thinkの作成画面
  def create
    
    if logged_in?
      #ログインしている場合
      @think=current_user.thinks.new(think_params)
    else
      #ログインしていない場合はfromuserアカウントが1になる
      @Nouser=User.find(1)
      @think=@Nouser.thinks.new(think_params)
    end
    
    #作成したthinkを保存する
    if @think.save
      
      redirect_to thinkfinish_index_path
      #送り主のuserを渡す
      
    else
      
      flash[:danger] = '人物名は10文字以内です'
      redirect_to fromthink_path(@think.user_id)
    end
    
  end
  
  private
  
  def think_params
    params.require(:think).permit(:user_id, :fromuser, :person)
    #thinkのパラメーターが送られてくる
  end
  
end
