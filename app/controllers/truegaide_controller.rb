class TruegaideController < ApplicationController
  def index
  end

  def show
    @user2=User.find(params[:id])
  end
end
