class Admin::TasksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :role_admin?

  def index






  end

  def search
# redirect_to admin_tasks_path(params[:task])

    @tasks = Task.scoped

    @tasks = @tasks.author_id(params[:task][:author_id]) if params[:task][:author_id].present?
    @tasks = @tasks.category_id(params[:task][:category_id]) if params[:task][:category_id].present?
    @tasks = @tasks.status_id(params[:task][:status_id]) if params[:task][:status_id].present?



    respond_to do |format|
      format.html { render :index, :locals => {tasks: @tasks} }
      format.json
      format.js
    end

  end


end