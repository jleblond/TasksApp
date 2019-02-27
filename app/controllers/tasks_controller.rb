class TasksController < ApplicationController
  before_filter :authenticate_user!

  def index
    @tasks_assigned = current_user.tasks_assigned
    @tasks_created = current_user.tasks_as_author


    @tasks = @tasks_assigned
    if params[:filter] == "authored"
       @tasks = @tasks_created
    end

  end

  def new
    @users = User.all # used in the form to select users to whom the task will be assigned to
    @task_categories = TaskCategory.all
  end

  def create
    @due_date = datetime_from_form(params[:due_dt])
    params[:task][:due_date]= @due_date
    @start_date = datetime_from_form(params[:start_dt])
    params[:task][:start_date] = @start_date


    @task = current_user.tasks_as_author.build(params[:task])

    if @task.save
     Assignation.create(task_id: @task.id, user_id: params[:users_assigned][:user_id])
      flash[:success] = "Task created!"
      redirect_to(tasks_path(filter:"authored"))
    else
      redirect_to(new_tasks_path)
    end

  end

  def show
    @task= Task.find(params[:id])

   # @comments = @task.comments

  end

  def edit
    @task= Task.find(params[:id])
  end


end