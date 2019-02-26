class TaskCategoriesController < ApplicationController
  before_filter :role_admin?

  def index
    @task_categories = TaskCategory.all

  end

  def new

  end

  def create
    @category = TaskCategory.create(params[:task_category])

    if @category
      flash[:success] = "Task Category created!"
      redirect_to(task_categories_path)
    else
      redirect_to(new_task_category_path)
    end

  end

  def edit
    @task_cat = TaskCategory.find(params[:id])

  end

  def update
    @task_cat = TaskCategory.find(params[:id])
    if @task_cat.update_attributes(params[:task_category])
      flash[:success] = "Category updated"
      redirect_to(task_categories_path)
    else
      redirect_to(edit_task_category_path)
    end
  end

  def destroy
    TaskCategory.find(params[:id]).destroy
    flash[:success] = "Category deleted"
    redirect_to(task_categories_path)
  end
end