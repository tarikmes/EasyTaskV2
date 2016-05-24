class SessionsController < ApplicationController

  def create
  	user = User.find_by email: params[:email]
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
      session[:user_name] = user.first_name
      if user.user_type.name == 'Admin'
        log_in user
    		render 'admin/admin_home' 
      else
        render 'users/user_home'
      end
  	else
      flash[:danger] = 'Invalid email/password combination' 
  		render 'new'
  	end
  end

  def destroy
  	session[:user_id] = nil
    reset_session
  	redirect_to login_path
  end

  def new
    session[:user_id] = nil
  end

  def log_in(user)
    session[:user_id] = user.id
  end
end

if (2 == "2")
  puts "false"
elsif (1 == "2")
  puts "also false"
else
  puts "true"
end