class TakedrecomController < ApplicationController
  def edit
    @updataletter = Postletter.find(params[:id])
  end
end
