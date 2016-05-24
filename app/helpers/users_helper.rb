module UsersHelper
  def manage_tasks_count_fo
    #user
    user.tasks.status(1).count
  end

end
