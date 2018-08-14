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
    Task.create!(permitted_params)
  end

  def update
    @task.update_attributes!(permitted_params)
  end

  def destroy
    @task.destroy
  end

  private

  def assign_task
    @task = Task.find(params[:id])
  end

  def permitted_params
    params.permit(:title, :author, :details)
  end
end
