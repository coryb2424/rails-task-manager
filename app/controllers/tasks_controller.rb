require 'pry'
class TasksController < ApplicationController
  before_action :assign_task, only: %i[edit update show destroy]

  def edit; end

  def show; end

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    Task.create!(task_params)
    redirect_to tasks_path
  end

  def update
    @task.update_attributes!(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def assign_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :author, :details)
  end
end
