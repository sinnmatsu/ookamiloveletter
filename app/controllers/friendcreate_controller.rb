class FriendcreateController < ApplicationController
  
  before_action :require_user_logged_in
  
  def index
  end

  def show
    @user=User.find(params[:id])
    @friend=current_user.friends.build
    # @myuserが入っている
  end
end
