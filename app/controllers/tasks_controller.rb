class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy, :restore, :really_destroy]

  def index
    @tasks = Task.where(user_id: current_user.id)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(create_params)
    @task.user_id = current_user.id
    if @task.save
      redirect_to tasks_path, notice: "Tarefa criada com sucesso."
    else
      redirect_to tasks_path, alert: "Ocorreu um erro ao criar a tarefa. Por favor, tente novamente."
    end
  end

  def edit; end

  def update
    @task.update(update_params)
    if @task.save
      redirect_to tasks_path, notice: "Tarefa alterada com sucesso."
    else
      redirect_to tasks_path, alert: "Ocorreu um erro ao alterar a tarefa. Por favor, tente novamente."
    end
  end

  def destroy
    if @task.delete
      redirect_to tasks_path, notice: "Tarefa movida para a lixeira."
    else
      redirect_to tasks_path, alert: "Ocorreu um erro ao mover a tarefa para a lixeira. Por favor, tente novamente."
    end
  end

  def trash
    @tasks = Task.only_deleted.where(user_id: current_user.id)
  end

  def restore
    if @task.restore
      redirect_to trash_tasks_path, notice: "Tarefa restaurada com sucesso."
    else
      redirect_to trash_tasks_path, alert: "Ocorreu um erro ao resturar a tarefa. Por favor, tente novamente."
    end
  end

  def really_destroy
    if @task.really_destroy!
      redirect_to trash_tasks_path, notice: "Tarefa excluída com sucesso."
    else
      redirect_to trash_tasks_path, alert: "Ocorreu um erro ao excluir a tarefa. Por favor, tente novamente."
    end
  end

  def destroy_all
    if destroy_all_tasks
      redirect_to tasks_path, notice: "Todas as tarefas foram excluídas."
    else
      redirect_to tasks_path, alert: "Ocorreu um erro ao excluir todas as tarefas. Por favor, tente novamente."
    end
  end

  def destroy_all_trash
    if destroy_all_trash_tasks
      redirect_to tasks_path, notice: "Lixeira esvaziada com sucesso."
    else
      redirect_to tasks_path, alert: "Ocorreu um erro ao esvaziar a lixeira. Por favor, tente novamente."
    end
  end

  protected

  def set_task
    @task = Task.with_deleted.find(params[:id])
  end

  def create_params
    params.require(:task).permit(:title, :description, :start_date, :finish_date, :is_important, :icon)
  end

  def update_params
    params.require(:task).permit(:title, :description, :start_date, :finish_date, :is_important, :icon)
  end

  def destroy_all_tasks
    Task.where(user_id: current_user.id).each do |task|
      task.really_destroy!
    end
  end

  def destroy_all_trash_tasks
    Task.only_deleted.where(user_id: current_user.id).each do |task|
      task.really_destroy!
    end
  end
end
