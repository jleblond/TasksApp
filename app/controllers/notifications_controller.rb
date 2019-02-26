class NotificationsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @notifications = current_user.notifications
  end


  def destroy
    Notification.find(params[:id]).destroy
    redirect_to notifications_url

  end
end