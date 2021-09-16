class TasksController < ApplicationController
  def index; end

  def new; end

  def create; end

  def edit; end

  def update; end

  def delete;

  protected

  def create_params
    params.require(:task).permit(:title, :description, :start_date, :finish_date, :is_important, :icon)
  end

  def update_params
    params.require(:task).permit(:title, :description, :start_date, :finish_date, :is_important, :icon)
  end
end
