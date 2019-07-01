class ChangelettersController < ApplicationController
  def index
  end

  def show
    
    @response=Response.find(params[:id])
    @changeletters = Changeletter.where(responsekey: String(params[:id])).order(id: "DESC")
    #レスポンスキーはString型になっているので、idをString型に変えないとエラーが起きる
    
  end

  def edit
    @changeletter = Changeletter.find(params[:id])
    
  end

  def create
    @changeletter=current_user.changeletters.build(changeletter_params)
    
    if @changeletter.save
      
      redirect_to lettersended_path(@changeletter.user_id)
      #文通を送った相手のuser.idを取得する
      
    else
      
      flash[:danger] = '手紙を送ることができませんでした'
      
    end
    
  end

  def update
    @changeletter = Changeletter.find(params[:id])
    #updateするchangeletterを取得する
    @changeletter.check = "true"
    
    if @changeletter.update(updateletter_params)
      redirect_to reply_path(@changeletter)
    else
      redirect_to 
    end
  end

  def destroy
    
    @changelettes = current_user.changeletters.find_by(id: params[:id])
    #自分の送ったレター
    unless @changelettes
      redirect_to delete_index_path
    else
      @changelettes.destroy
      redirect_to changeletter_path(@changelettes.responsekey)
    end
    
    
    
  end
  
  private
  
  def changeletter_params
    params.require(:changeletter).permit(:user_id, :fromuser, :text, :responsekey) 
  end
  
  def updateletter_params
    params.require(:changeletter).permit(:user_id, :fromuser, :text, :responsekey, :check) 
  end
  
  
  
end
