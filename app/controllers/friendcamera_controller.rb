class FriendcameraController < ApplicationController
  
  before_action :require_user_logged_in
  
  def index
  end

  def show
    @createdfriend = Friend.find(params[:id])
  end
end
