class TaskObserver < ActiveRecord::Observer
  observe :task


  def after_update(task)
    if task.status_id_changed?
      notif_message = "Task "+task.task_name+" status was updated"

      if User.current.present?
        notif_message +=  "by "+User.current
      end

      Notification.create(description: notif_message, user_id: task.author_id, read: false)


    end
  end




end