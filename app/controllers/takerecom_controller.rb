class TakerecomController < ApplicationController
  def index
  end

  def show
    @recom = Postletter.find(params[:id])
    #選択したletter
  end
end
