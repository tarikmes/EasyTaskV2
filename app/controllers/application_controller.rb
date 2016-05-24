class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :task_status_count
  helper_method :task_types
  helper_method :user_name
  helper_method :resources_count
  helper_method :test

  def current_user
    if @current_user 
      @current_user
    else
      @current_user = User.find session[:user_id]
    end 
  end

  def task_status_count(status)
    @task_status_count = Task.status(status).count
  end

  def resources_count(id)
    resource = Resource.find(id)
    @resource_cont = resource.quantity
  end

  def user_name(id)
    user = User.find(id)
    @user_name = user.first_name
  end
end
