class Admin::TaskStatusesController < ApplicationController

	def index
		@statuses = TaskStatus.all
	end

	def show
		@status = TaskStatus.find(params[:id])
	end

	def new
		@status = TaskStatus.new
	end

	def edit
		@status = TaskStatus.find(params[:id])
	end

	def create
		@status = TaskStatus.new(task_status_params)
		if @status.save
			redirect_to admin_task_statuses_path
		else
			render 'New'
		end
	end

	def update
		@status  = TaskStatus.find(params[:id])
		if @status.update(task_status_params)
			redirect_to admin_task_statuses_path
		else
			render 'Edit'
		end
	end

	def destroy
		@status = TaskStatus.find(params[:id])
		@status.destroy
		redirect_to admin_task_statuses_path
	end

	private
	def task_status_params
		params.require(:task_status).permit(:name)
	end


end
