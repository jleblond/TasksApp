class Admin::TasksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :role_admin?

  def index






  end

  def search
# redirect_to admin_tasks_path(params[:task])

    @t = Task.scoped
    @t = @t.author_id(params[:task][:author_id]) if params[:task][:author_id].present?
    @t = @t.category_id(params[:task][:category_id]) if params[:task][:category_id].present?
    @t = @t.status_id(params[:task][:status_id]) if params[:task][:status_id].present?

    @u_t = User.find(params[:user_assigned_id]).tasks_assigned

    @tasks = @t & @u_t


    respond_to do |format|
      format.html { render :index, :locals => {tasks: @tasks} }
      format.json
      format.js
    end

  end


end