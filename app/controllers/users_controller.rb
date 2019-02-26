class UsersController < ApplicationController
  before_filter :authenticate_user!, only: [:index]
  before_filter :correct_user, only: [:show, :edit, :update]
  # before_filter :admin  only: [ :show, :edit, :update, :destroy]


  def index
    @users = User.all

  end

  def show

  end

  def edit

  end

  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def current_user?(user)
    user == current_user
  end

end