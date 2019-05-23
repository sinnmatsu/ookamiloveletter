class SecretsController < ApplicationController
  
  def edit
    @myuser=current_user
    @mysecret=Secret.find(params[:id])
  end
  
  def update
    @secret=Secret.find(params[:id])
    #@secretは変更する自分の「秘密」
    
    if @secret.update(postsecret_params)
      flash[:success]= "変更しました"
      redirect_to root_url
    else
      flash[:danger] = @secret.errors
      redirect_to secret_index_path
      
    end
    
    
  end
  
  
  def create
    @secret=current_user.secrets.build(postsecret_params)
    
    if @secret.save
      #自分のカラムが入ったsecretが生成される
      flash[:success]= "保存しました"
      redirect_to root_url
      
    else
      flash[:danger] = @secret.errors
      redirect_to secret_index_path
    end
    
  end

  def destroy
  end


  
  private
  
  def postsecret_params
    params.require(:secret).permit(:user_id,:secrettext) 
    #自分のカラムと「秘密」が入ったsecretが生成される。
  end
  

  
end
