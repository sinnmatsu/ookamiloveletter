class PostlettersController < ApplicationController
  
  before_action :correct_user, only: [:destroy, :update]
  
  
  def create
    
    if logged_in?
      @postletter=current_user.postletters.new(postletter_params)
    else
      @Nouser=User.find(1)
      @postletter=@Nouser.postletters.new(postletter_params)
    end
    
    
    if @postletter.save
      #成功したら
      
      if @postletter.which == "recom"
        redirect_to recomfinish_path(@postletter.user_id)
      elsif @postletter.which == "think"
        redirect_to thinkfinish_path(@postletter.user_id)
      elsif @postletter.which == "truths"
        redirect_to letterfinish_path(@postletter.user_id)
      elsif @postletter.which == "lies"
        redirect_to ookamifinish_path(@postletter.user_id)
      end
      
    else
      
      
      if @postletter.which == "truths"
        
        flash[:danger] = '18文字以上のletterを送ってください'
        redirect_to truth_path(@postletter.user_id)
        
      elsif @postletter.which == "lies"
      
        flash[:danger] = '18文字以上のletterを送ってください'
        redirect_to ly_path(@postletter.user_id)
        
      elsif @postletter.which == "recom"
      
        flash[:danger] = '人物名は10文字以内、理由は80文字以内です'
        redirect_to recom_path(@postletter.user_id)
        
      elsif @postletter.which == "think"
      
        flash[:danger] = '人物名は10文字以内です'
      redirect_to fromthink_path(@postletter.user_id)
      
      end
      
    end
  end

  def destroy
    
  end
  
  def edit
    
    @updataletter = Postletter.find(params[:id])
    #letterかookamiどっちかの通知
    
  end
  
  def update
    
    @receiveletter = Postletter.find(params[:id])
    
      #アップデート前のletterも受け取れるようにするための処理
      unless @receiveletter.person
        @receiveletter.person = "なし"
      else
        #特になし
      end
      
      
      unless @receiveletter.reason
        @receiveletter.reason = "なし"
      else
        #特になし
      end
      
    
      @receiveletter.check = "true"
      
      if @receiveletter.update(updata_postletter_params)
        
        if @receiveletter.which == "truths"
          redirect_to trueproduction_path(@receiveletter)
        elsif @receiveletter.which == "lies"
          redirect_to ookamiproduction_path(@receiveletter)
        elsif @receiveletter.which == "recom"
          redirect_to takeletters_path
        elsif @receiveletter.which == "think"
          redirect_to takeletters_path
        end
          
      else
        
      end
    
    

  end
  
  private
  
  def postletter_params
    params.require(:postletter).permit(:user_id, :fromuser, :text, :which, :account, :person, :reason) 
  end
  
  
  def nouser_postletter_params
    params.require(:postletter).permit(:user_id, :text, :which, :account) #truthの場合のみアカウント名が渡される
    #postletterのパラメーターが送られてくる
  end
  
  
  
  def updata_postletter_params
    params.require(:postletter).permit(:user_id, :fromuser, :text, :which, :check, :account, :person, :reason)
  end
  
  
  
  def correct_user
    @postletteres = current_user.reverses_of_postletters.find_by(id: params[:id])
    #ログインしているユーザー以外が自分宛の手紙を見れないようにする処理
    unless @postletteres
    #自分以外のpostletterだったらトップページに戻る
      redirect_to root_url
    end
  end
  
  
end
