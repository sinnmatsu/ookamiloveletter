class LookfriendController < ApplicationController
  def index
  end

  def show
    @user=User.find(params[:id])
    @friends = Friend.where(user_id: @user.id).order(id: "DESC")
  end
end
