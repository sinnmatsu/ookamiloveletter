class GaidesController < ApplicationController
  
  before_action :require_user_logged_in
  #ログインしていない場合はトップページへ
  
  def index
  end
end
