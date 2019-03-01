class ApplicationController < ActionController::Base
  protect_from_forgery

  def role_admin?
    current_user.admin?
  end

  def date_from_form dt_param
   p = dt_param
   date = Date.new(p[:year].to_i, p[:month].to_i, p[:day].to_i)
  rescue ArgumentError => e
   # flash[:error] = e.message
    date = nil
   # redirect_to :back
   return
  end
  


end
