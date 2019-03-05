class HomeController < ApplicationController


  def index
    if user_signed_in?
      User.current = current_user
      redirect_to :controller => 'notifications', :action =>'index'
    else
      redirect_to(new_user_session_path)
    end

  end
end