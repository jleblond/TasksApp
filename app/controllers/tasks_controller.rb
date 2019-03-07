class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_edit_permission, only: [:edit, :update]

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
    due_date = date_from_form(params[:due_dt])
    params[:task][:due_date]= due_date
    start_date = date_from_form(params[:start_dt])
    params[:task][:start_date] = start_date

    params[:task][:status_id] = TaskStatus.find_by_status("Created").id

    @task = current_user.tasks_as_author.build(params[:task])

    if @task.save
      params[:users_assigned][:user_id].each { |u_id|
        Assignation.create(task_id: @task.id, user_id: u_id) if !u_id.blank?
      }
      flash[:notice] = "Task created!"
      redirect_to(tasks_path(filter:"authored"))
    else
      flash[:alert] = "Task was not created"
      redirect_to(new_task_path)
    end

  end


  def show
    @task= Task.find(params[:id])
    @author = Task.find(params[:id]).author
   # @comments = @task.comments
  end


  def edit
    @task= Task.find(params[:id])

    @users = User.all # used in the form to select users to whom the task will be assigned to
    @task_categories = TaskCategory.all
    @task_statuses = TaskStatus.all

    @users_assigned_ids = @task.users_assigned.pluck(:id)
  end


  def update
   @task= Task.find(params[:id])

   due_date = date_from_form(params[:due_dt])
   params[:task][:due_date] = due_date
   start_date = date_from_form(params[:start_dt])
   params[:task][:start_date] = start_date

    if @task.update_attributes(params[:task])
      # Delete assignations for which their user_id does not match a user_id in params[:users_assigned]
      assignations = Assignation.where(task_id:@task.id)
      assignations.pluck(:user_id).each { |a|
          unless params[:users_assigned].include?(a.to_s)
           assignation_id = Assignation.where(task_id: @task.id, user_id: a).pluck(:id)
           Assignation.destroy(assignation_id)
          end
      }

      # Create assignations that were added to the form
      params[:users_assigned].each { |u_id|
        if !u_id.blank? && Assignation.where(task_id: @task.id, user_id: u_id).empty?
        Assignation.create(task_id: @task.id, user_id: u_id)
        end
      }

      flash[:notice] = "Task updated"
      redirect_to(task_path(@task))
    else
      flas[:alert] = "Task was not updated"
      render 'edit'
    end

  end


  private

  def require_edit_permission
    if current_user != Task.find(params[:id]).author && !current_user.admin?
      redirect_to(tasks_path(filter:"authored"))
    end
  end


end