class UsersController < ApplicationController
  # before_filter :authenticate_user!, only: [:index]
  before_filter :correct_user, only: [:show, :edit, :update]
  before_filter :role_admin?,  only: [ :index, :show, :edit, :update, :destroy]


  def index
    @users = User.all

  end

  def show

  end

  def edit
  @user = User.find(params[:id])
  end

  def update

  end

  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user) || current_user.admin?
  end

  def current_user?(user)
    user == current_user
  end



end