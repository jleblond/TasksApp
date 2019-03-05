class TaskObserver < ActiveRecord::Observer
  observe :task


  # def after_update(task)
  #   if task.status_id_changed?
  #     notif_message = "Task "+task.task_name+" status was changed"
  #
  #     if User.current.present?
  #       notif_message +=  "by "+User.current
  #     end
  #
  #     Notification.create(description: notif_message, user_id: task.author_id, read: false)
  #
  #     # users_assigned_ids = task.users_assigned.pluck(:id)
  #     #
  #     # users_assigned_ids.each do |id|
  #     #   Notification.create(description: notif_message, user_id: id, read: false)
  #     # end
  #
  #
  #   end
  # end


  def admin_users
    admins = UserRole.where(role_id: Role.admin_role.id).pluck(:id)
  end

end