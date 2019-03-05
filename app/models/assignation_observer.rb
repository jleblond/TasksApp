class AssignationObserver < ActiveRecord::Observer
  observe :assignation

  def after_create(assignation)
    task_id = assignation.task_id
    notif_message = "Task "+Task.find(task_id).task_name+" is assigned to you"

    if User.current.present?
      notif_message += " by "+User.current
    end

    Notification.create(description: notif_message, user_id: assignation.user_id, read: false)


  end


  def admin_users
    admins = UserRole.where(role_id: Role.admin_role.id).pluck(:id)
  end

end