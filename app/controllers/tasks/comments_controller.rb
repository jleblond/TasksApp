class Tasks::CommentsController < ApplicationController
  def create
  @task = Task.find(params[:task_id])
  params[:comment][:user_id] = current_user.id


  @task.comments.create(params[:comment])


    redirect_to(task_path(@task))

  end


end