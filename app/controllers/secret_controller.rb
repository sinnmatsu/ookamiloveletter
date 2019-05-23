class SecretController < ApplicationController
  
  def index
    @myuser=current_user
    @postsecret=current_user.secrets.build
    @mysecret=Secret.where(user_id: current_user.id).first
  end

  def show
    
  end
  
end
