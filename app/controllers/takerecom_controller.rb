class TakerecomController < ApplicationController
  def index
  end

  def show
    @updataletter = Postletter.find(params[:id])
    #選択したletter
  end
end
