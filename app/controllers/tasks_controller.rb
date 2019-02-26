class TasksController < ApplicationController
  before_filter :authenticate_user!

  def index
    @tasks_assigned = current_user.tasks_assigned
    @tasks_created = current_user.tasks_as_author


  end

  def new
    @users = User.all
  end

  def create
    @task = current_user.tasks_as_author.build(params[:task])

    if @task.save
     Assignation.create(task_id: @task.id, user_id: params[:users_assigned][:user_id])
      flash[:success] = "Task created!"
      redirect_to(tasks_path)
    else
      redirect_to(new_tasks_path)
    end

  end


end