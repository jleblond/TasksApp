class Admin::TasksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :role_admin?

  def index
      @tasks = Task.all
  end


end