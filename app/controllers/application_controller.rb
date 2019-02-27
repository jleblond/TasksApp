class ApplicationController < ActionController::Base
  protect_from_forgery

  def role_admin?
    current_user.admin?
  end

=begin
  def dt_form_to_db params
    date_time = params[:year]
  end
=end

end
