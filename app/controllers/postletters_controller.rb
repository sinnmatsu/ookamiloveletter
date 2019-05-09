class PostlettersController < ApplicationController
  
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :update]
  
  
  #letterを送るボタンを押した時に反応する
  def create
    
    @postletter=current_user.postletters.new(postletter_params)
    #自分が作成したletterのインスタンス
    if @postletter.save
      
      redirect_to root_url
      
    else
      
      render 'lies/index'
      
    end
  end

  def destroy
    
  end
  
  def edit
    
    @updataletter = Postletter.find(params[:id])
    #クリックした通知のインスタンス
    
    if @updataletter.check =="true"
    #受け取るボタンを押した時に反応する
      
      
      @time = @updataletter.disclosure_at
      gon.settimer = @time.to_s(:number)
      #時刻を文字列の数字に変換する
      
    end
    
  end
  
  def update
    
    #パラメーター値に更新する値を代入している
    @receiveletter = Postletter.find(params[:id])
    
    if @receiveletter.check != nil
      #checkがnilでなければ
      
      @receiveletter.timercheck = "true"
      if @receiveletter.update(updata_timer_postletter_params)
        
        
        if @receiveletter.which == "truths"
          redirect_to trueproduction_path(@receiveletter)
        elsif @receiveletter.which == "lies"
          redirect_to ookamiproduction_path(@receiveletter)
        end
        
      else
        
        render controller: 'postletters/edit'
      end
      
    else
      
      @receiveletter.check = "true"
      @receiveletter.disclosure_at = Time.now.in_time_zone('Tokyo')
      #disclosure_atに現在時刻を叩きこむ
      
      if @receiveletter.update(updata_postletter_params)
        
        redirect_to edit_postletter_path(@receiveletter)
        #もう一度postlettersのeditが反応する、この時にJSのタイマーが発動する
      
      else
        #フラッシュメッセージはCSSが崩れるので表示しない
        render 'takeletters/index'
      end
    end
    

  end
  
  private
  
  def postletter_params
    params.require(:postletter).permit(:user_id, :fromuser, :text, :which, :account) #truthの場合のみアカウント名が渡される
    #postletterのパラメーターが送られてくる
  end
  
  def updata_postletter_params
    params.require(:postletter).permit(:user_id, :fromuser, :text, :which, :check, :account, :disclosure_at)
  end
  
  def updata_timer_postletter_params
    params.require(:postletter).permit(:user_id, :fromuser, :text, :which, :check, :account, :timercheck)
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
