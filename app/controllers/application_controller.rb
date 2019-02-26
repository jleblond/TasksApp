class ApplicationController < ActionController::Base
  protect_from_forgery

  def role_admin?
    current_user.admin?
  end

end
