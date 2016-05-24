class Admin::UsersController < ApplicationController


	def index
    #@search = User.search(params[:q])
		#@users = @search.result
    @users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save 
			redirect_to admin_users_path
		else
			render new
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)  && @user.id != current_user.id
      flash.now[:notice] = "Post successfully created"
      render 'edit'
      
			
    elsif @user.update(user_params) && @user.id == current_user.id
      render 'edit'
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
    @user.destroy
		#redirect_to admin_users_path
	end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :email, :user_type_id, :password_confirmation)
  end
end
