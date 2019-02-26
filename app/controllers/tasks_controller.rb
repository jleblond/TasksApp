class TasksController < ApplicationController
  def index
    @tasks_assigned = current_user.tasks_assigned
    @tasks_created = current_user.tasks_as_author


  end

  def create
    @task = current_user.tasks_as_author.build(params[:task])

    if @task.save
      flash[:success] = "Task created!"
      redirect_to(tasks_path)
    else
      redirect_to(new_tasks_path)
    end

  end


end