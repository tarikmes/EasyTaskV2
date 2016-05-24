class UsersController < ApplicationController

	def get_user_tasks
		#@tasks = Task.all
	end
	helper_method :get_user_tasks


  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
    else
      render new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] =  'spasio'
      render 'edit'
    else
      flash[:notice] =  'nije'
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :email, :user_type_id)
  end

end


