class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :role_admin?


  def index
    @users = User.all
  end


  def show
    @user = User.find(params[:id])
  end


  def new
  end


  def create
    @user = User.new(params[:user])
    if @user.save
      params[:user_roles].each { |r_id|
        UserRole.create(user_id: @user.id, role_id: r_id) if !r_id.blank?
      }
      flash[:notice] = "User created!"
      redirect_to(admin_users_path)
    else
      flash[:alert] = "User not created"
      render 'new'
    end
  end


  def edit
    @user = User.find(params[:id])
    @user_roles_ids = @user.roles.pluck(:role_id)
  end


  def update
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end

    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      UserRole.delete_all(user_id: @user.id)
    #  UserRole.create(user_id: @user.id, role_id: Role.regular_role.id)
      params[:user_roles].each { |r_id|
        UserRole.create(user_id: @user.id, role_id: r_id) if !r_id.blank?
      }
      flash[:notice] = "Profile updated"
      redirect_to(admin_user_path(@user))
    else
      flash[:alert] = "User profile not updated"
      redirect_to(admin_user_path(@user))
    end

  end


  def destroy
    @user = User.find(params[:id])
    if User.find(params[:id]).destroy
      flash[:notice] = "User deleted"
      redirect_to(admin_users_path)
    elsif
      flash[:alert] = "User not deleted"
      redirect_to(admin_user_path(@user))
    end
  end


  private

  def current_user?(user)
    user == current_user
  end



end