class ResponsesController < ApplicationController
  
  
  def index
  end

  def show
    
    
    @responses = Response.where(user_id: current_user.id).order(id: "DESC")+Response.where(fromuser_id: current_user.id).order(id: "DESC")
    #全体のレスポンスキーを取得
    @responses.each do |responses|
      @responsess = responses
    end
    
    
  end

  def edit
    #文通画面
  end

  def create
    #responseキーの作成画面
    @response=current_user.responses.new(response_params)
    
    if @response.save
      redirect_to toletter_path(@response)
      #レスポンスキーを作ったあとは文通レター作成画面に飛ぶ
    else
      #失敗したらもう一度レスポンスキーを作る画面に飛ぶ
      redirect_to lookletter_path(@response.user)
      flash[:danger] = '手紙を送りました'
    end
    
    
  end

  def destroy
  end

  def update
  end
  
  private
  def response_params
    params.require(:response).permit(:user_id, :fromuser) 
    #userとfromuserしか受け付けない
  end
  
end
