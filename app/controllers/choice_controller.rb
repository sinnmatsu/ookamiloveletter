class ChoiceController < ApplicationController
  
  #ログインしていなくてもコントローラーが反応する
  
  def index
  end
  
  def show
    @user1=User.find(params[:id])
  end
end
