class UserObserver < ActiveRecord::Observer
  observe :user

  # def after_create(user)
  #   notif_message = "User "+user.name+" created by "+current_user.name
  #
  #   Notification.create(description:"test notification on create", user_id:2, read:false)
  #
  #   admin_users.each do |id|
  #     Notification.create(description: notif_message, user_id: id, read: false)
  #   end
  #
  # end



  # def admin_users
  #   admins = UserRole.where(role_id: Role.admin_role.id).pluck(:id)
  # end
end