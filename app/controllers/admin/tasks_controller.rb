class Admin::TasksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :role_admin?

  def index

      @task_categories = TaskCategory.all
      @task_statuses = TaskStatus.all
      @users = User.all

      @tasks = Task.where(nil)

    @tasks = @tasks.author_id(params[:author_id]) if params[:author_id].present?
    @tasks = @tasks.category_id(params[:category_id]) if params[:category_id].present?
    @tasks = @tasks.status_id(params[:status_id]) if params[:status_id].present?


    #
    # respond_to do |format|
    #   format.html { render :index, :locals => {tasks: @tasks} }
    #   format.json
    #   format.js { render :index, :locals => {tasks: @tasks} }
    # end

  end

  def search
     @tasks = Task.where(nil)
     @tasks = @tasks.author_id(params[:author_id]) if params[:author_id].present?
     @tasks = @tasks.category_id(params[:category_id]) if params[:category_id].present?
     @tasks = @tasks.status_id(params[:status_id]) if params[:status_id].present?



    respond_to do |format|
      format.html { render :index, :locals => {tasks: @tasks} }
      format.json
      format.js { render :index, :locals => {tasks: @tasks} }
    end


  end


end