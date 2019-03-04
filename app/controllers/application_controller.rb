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


  def send_create_notification message, recipients

    # Notification.create(description:"test notification on create", user_id:2, read:false)

    if recipients.nil?
      recipients = admin_users
    end

    recipients.each do |id|
      Notification.create(description: message, user_id: id, read: false)
    end
  end


  def admin_users
    admins = UserRole.where(role_id: Role.admin_role.id).pluck(:id)
  end


end
