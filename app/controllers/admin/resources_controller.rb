class Admin::ResourcesController < ApplicationController

  def index
    @resources = Resource.all
  end

  def new
    @resource = Resource.new
      respond_to do |format|
    format.html
    format.js
  end
  end
def edit
  @resource = Resource.find(params[:id])
end

  def create
    @resource = Resource.new(resource_params)
     @resources = Resource.all
    flash[:notice] = "prije save"
    if @resource.save 
      redirect_to admin_resources_path
    else
      render new
    end
  end

    def update 
    @resource = Resource.find(params[:id])
      if @resource.update(resource_params)
        redirect_to admin_resources_path
      end
      end

  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy
    redirect_to admin_resources_path
  end

  private
  def resource_params
      params.require(:resource).permit(:name, :quantity)
  end

end
