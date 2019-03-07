class Admin::TaskCategoriesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :role_admin?

  def index
    @task_categories = TaskCategory.all
  end

  def new

  end

  def create
    @category = TaskCategory.create(params[:task_category])

    if !@category.id == nil
      flash[:notice] = "Task Category created!"
      redirect_to(admin_task_categories_path)
    else
      flash[:alert] = "Task Category not created"
      redirect_to(new_admin_task_category_path)
    end
  end

  def edit
   @task_category = TaskCategory.find(params[:id])
  end

  def update
    @task_category = TaskCategory.find(params[:id])
    if @task_category.update_attributes(params[:task_category])
      flash[:notice] = "Category updated"
      redirect_to(admin_task_categories_path)
    else
      flash[:alert] = "Category not updated"
      redirect_to(edit_admin_task_category_path)
    end
  end

  def destroy
    if TaskCategory.find(params[:id]).destroy
      flash[:notice] = "Category deleted"
      redirect_to(admin_task_categories_path)
    elsif
      flash[:alert] = "Category not deleted"
      redirect_to(edit_admin_task_category_path)
    end
  end


end