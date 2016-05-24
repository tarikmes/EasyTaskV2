class RemoveIsParentFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :is_parent, :integer
  end
end
