class FriendsController < ApplicationController
  
  
  
  def create
    
    
    @friend = current_user.friends.build(friend_params)
    #current_userが勝手にuser_idに代入される
    if @friend.save
      
      redirect_to friendcamera_path(@friend)
      #現在のfriendの数字が渡される
    else
      flash[:danger] = '文章は90文字以内また人物名が15文字以内にしてください'
      redirect_to friendcreate_path(@friend.user_id)
    end
    
  end

  def destroy
  end
  
  def show
    @friend = Friend.find(params[:id])
  end

  def index
    if logged_in?
      @myuser=current_user
      @friend=current_user.friends.build
      @friends = Friend.where(user_id: current_user.id).order(id: "DESC")
      #user_idが自分のidのやつだけを取得
    end
  end
  
  private
  
  def friend_params
    params.require(:friend).permit(:sentence, :person)
  end

  
end

