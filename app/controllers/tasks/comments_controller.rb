class Tasks::CommentsController < ApplicationController
  def create
  @task = Task.find(params[:task_id])
  params[:comment][:user_id] = current_user.id


  @task.comments.create(params[:comment])

  respond_to do |format|
    format.html
    format.json
    format.js
  end


  end


end