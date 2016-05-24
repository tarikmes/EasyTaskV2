class Admin::UsedResourcesController < ApplicationController

  def index
    @used_resource = UsedResource.all
  end

  def show
    @used_resource = UsedResource.find(params[:id])
  end

  def new
    @used_resource = UsedResource.new
  end

  def edit
    @used_resource = UsedResource.find(params[:id])
  end

  def create
    @used_resource = UserResource.new(used_resource_params)
    #@task.used_resources.build(used_resources_params)
    #@task.used_resorurces = @resources
    if @used_resource.save
      flash[:notice] = used_resource_params.inspect

    else
      puts @task.errors.full_messages
      render 'new'
    end
  end

    def used_resource_params
    params.require(:used_resource).permit(:resource_id, :used, :id)
  end
end

