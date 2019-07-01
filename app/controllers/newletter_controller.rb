class NewletterController < ApplicationController
  
  def show
    @changeletter=Changeletter.find(params[:id])
  end
end
