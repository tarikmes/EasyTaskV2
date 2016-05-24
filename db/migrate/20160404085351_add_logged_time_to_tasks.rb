class AddLoggedTimeToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :logged_time, :int
  end
end
