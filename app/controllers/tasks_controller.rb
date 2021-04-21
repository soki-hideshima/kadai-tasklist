class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def index
    #@tasks = Task.all
    if logged_in?
      @task = current_user.tasks.build  # form_with 用
      @tasks = current_user.tasks.order(id: :desc).page(params[:page])
    end
  end

  def show
    set_task
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    #@task = Task.new(task_params)
    @task = current_user.tasks.build(task_params)

    if @task.save
      flash[:success] = 'タスクが正常に投稿されました'
      redirect_to root_url
    else
      @task = current_user.tasks.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'タスクが投稿されませんでした'
      render :new
    end
  end
  def edit
    set_task
  end

  def update
    set_task

    if @task.update(task_params)
      flash[:success] = 'タスクは正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @task = current_user.tasks.build
    @task.destroy
    flash[:success] = 'タスクは正常に削除されました'
    redirect_back(fallback_location: root_path)
  end
    
     private
     
  def set_task
    @task = Task.find(params[:id])
    #@task = current_user.tasks.build
  end

  # Strong Parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end  
    
    
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
end  
