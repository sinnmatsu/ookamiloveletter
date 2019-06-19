class TakedthinkController < ApplicationController
  def edit
    @updataletter = Postletter.find(params[:id])
  end
end
