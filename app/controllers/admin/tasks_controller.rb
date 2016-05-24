class Admin::TasksController < ApplicationController

  def index
    if params[:task_status_id]
      @tasks = Task.status(params[:task_status_id])  
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
    gon.resources = Resource.all
    @task = Task.new
    @task.used_resources.build
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create 
    @task = Task.new(task_params)
    if @task.save
      redirect_to admin_tasks_path
    else
      render 'new'
    end
  end

  def update 
    @task = Task.find(params[:id])
      if @task.update(task_params)
        respond_to do | format |
        format.html do 
        render 'edit'
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
    @search = Task.search(params[:q])
    @tasks = @search.result
  end

  def user_report
    @search = Task.search(params[:q])
    @tasks = @search.result
  end

  def time_report
    if params[:date_from] && params[:date_to]
      date_from = DateTime.parse(params[:date_from])
      date_to = DateTime.parse(params[:date_to])
      @tasks = Task.created_at_range(date_from, date_to)
    else
      @tasks = Task.all
    end
  end

  def resource_report
    if params[:date_from] && params[:date_to]
      date_from = DateTime.parse(params[:date_from])
      date_to = DateTime.parse(params[:date_to])
      @used_resources = UsedResource.created_at_range(date_from,date_to)
    else
      @used_resources = UsedResource.all
    end
  end

  def task_resource_report
    @search = UsedResource.search(params[:q])
    @resources = @search.result
    #@resources = UsedResource.all
  end


  private
    def task_params
      params.require(:task).permit(:name, :description, :logged_time, :parcent_done, :user_id, :task_status_id, :estimate, 
                                  :parent_task_id, :is_parent, :created_by, used_resources_attributes: [:resource_id, :used] ) 
    end

    def resources_params

      params.require(:used_resources).permit(:resource_id, :used)
      
    end
end
    


