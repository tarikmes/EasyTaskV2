class ChangeColumnDefault < ActiveRecord::Migration
  def change
    change_column :tasks, :task_status_id, :integer, :default => 1
  end
end
