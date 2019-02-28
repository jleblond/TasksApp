class Admin::UsersController < ApplicationController
  before_filter :role_admin?


  def index
    @users = User.all

  end

  def show
    @user = User.find(params[:id])
  end


  def update

  end

  private


  def current_user?(user)
    user == current_user
  end



end