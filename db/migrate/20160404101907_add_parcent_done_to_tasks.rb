class AddParcentDoneToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :parcent_done, :int
  end
end
