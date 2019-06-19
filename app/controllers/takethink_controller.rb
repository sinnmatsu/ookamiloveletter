class TakethinkController < ApplicationController
  
  def index
  end

  def show
    @think = Postletter.find(params[:id])
    
  end
end
