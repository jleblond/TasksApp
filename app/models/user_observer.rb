class UserObserver < ActiveRecord::Observer
  observe :user

  def after_create(user)
    notif_message = "User "+user.name+"was created"

    if User.current.present?
      notif_message +=  "by "+User.current
    end

    admin_users.each do |id|
      Notification.create(description: notif_message, user_id: id, read: false)
    end

  end


  def admin_users
    admins = UserRole.where(role_id: Role.admin_role.id).pluck(:id)
  end

end