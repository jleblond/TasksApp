class Admin::TasksController < ApplicationController
  before_filter :role_admin?

  def index
      @tasks = Task.all
  end


end