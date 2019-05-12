class SendgaideController < ApplicationController
  def index
  end

  def show
    @userlogin=User.find(params[:id])
    #最初に表示するuserのid
  end
end
