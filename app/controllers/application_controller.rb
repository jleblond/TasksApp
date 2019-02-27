class ApplicationController < ActionController::Base
  protect_from_forgery

  def role_admin?
    current_user.admin?
  end

  def datetime_from_form dt_param
   p = dt_param
   date_time = DateTime.new(p[:year].to_i, p[:month].to_i, p[:day].to_i, p[:hour].to_i, p[:minute].to_i, 0)
  rescue ArgumentError => e
   # flash[:error] = e.message
    date_time = nil
   # redirect_to :back
   return
  end



end
