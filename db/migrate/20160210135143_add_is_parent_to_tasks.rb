class AddIsParentToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :is_parent, :boolean, :default => false
  end
end
