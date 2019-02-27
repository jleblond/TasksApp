class Admin::TaskCategoriesController < ApplicationController
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
      redirect_to(admin_task_categories_path)
    else
      redirect_to(new_admin_task_category_path)
    end

  end

  def edit
   @task_category = TaskCategory.find(params[:id])

  end

  def update
    @task_category = TaskCategory.find(params[:id])
    if @task_category.update_attributes(params[:task_category])
      flash[:success] = "Category updated"
      redirect_to(admin_task_categories_path)
    else
      redirect_to(edit_admin_task_category_path)
    end
  end

  def destroy
    TaskCategory.find(params[:id]).destroy
    flash[:success] = "Category deleted"
    redirect_to(admin_task_categories_path)
  end
end