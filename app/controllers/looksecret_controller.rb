class LooksecretController < ApplicationController
  def index
  end

  def show
    @user=User.find(params[:id])
    @secret=Secret.where(user_id: @user.id).first
    #letterを送ったuserの「秘密」を取得する
  end
end
