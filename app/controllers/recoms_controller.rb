class RecomsController < ApplicationController
  
  def index
  end

  def show
    
    if logged_in?
      @postletter=current_user.postletters.build
    else
      @postletter=Postletter.new
    end
    
    @user=User.find(params[:id])
    
  end

  def create
    
    if logged_in?
      #ログインしている場合
      @recom=current_user.recoms.new(recom_params)
    else
      #ログインしていない場合はfromuserアカウントが1になる
      @Nouser=User.find(1)
      @recom=@Nouser.recoms.new(recom_params)
    end
    
    #作成したthinkを保存する
    if @recom.save
      
      redirect_to recoms_path
      
    else
      
      flash[:danger] = '人物名は10文字以内、理由は80文字以内です'
      redirect_to recom_path(@recom.user_id)
      
    end
    
  end
  
  private
  
  def recom_params
    params.require(:recom).permit(:user_id, :fromuser, :person, :reason)
    #thinkのパラメーターが送られてくる
  end
  
  
end
