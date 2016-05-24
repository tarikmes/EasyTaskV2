class TasksController < ApplicationController
  #before_action :find_record

  def index
    if params[:task_status_id]
      @tasks = current_user.tasks.status(params[:task_status_id])  
    else
      @tasks = Task.all
    end
  end

  def show
    @task = Task.find(params[:id])
    if @task.parent_task_id 
      @parent = Task.find(@task.parent_task_id)
    else
      @parent = Task.new
    end
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create 
      @task = Task.new(task_params)
    if @task.save
      redirect_to user_tasks_path
    else
      render 'new'
    end
  end

  def update 
    @task = Task.find(params[:id])
      if @task.update(task_params)
        respond_to do | format |
        format.html do 
        redirect_to user_tasks_path 
      end
      format.json do
        render json: @task.to_json 
      end
      end
        
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to admin_tasks_path
  end

  def search
  end
  
  private
    def task_params
      params.require(:task).permit(:description, :logged_time, :parcent_done, :user_id, :task_status_id)
    end
end
    
