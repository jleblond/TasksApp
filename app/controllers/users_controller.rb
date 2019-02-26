class UsersController < ApplicationController
  before_filter :correct_user, only: [:show, :edit, :update]
  # before_filter :admin  only: [:index, :show, :edit, :update, :destroy]


  def index

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