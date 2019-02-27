class TasksController < ApplicationController
  before_filter :authenticate_user!

  def index


    @tasks_assigned = current_user.tasks_assigned
    @tasks_created = current_user.tasks_as_author

    if role_admin?
      @tasks_all = Task.all
    end
  end

  def new
    @users = User.all # used in the form to select users to whom the task will be assigned to
    @task_categories = TaskCategory.all
  end

  def create
    params[:due_dt]
    params[:start_dt]


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