class ChangeParcentDoneColumnDefault < ActiveRecord::Migration
  def change
    change_column :tasks, :parcent_done, :integer, :default => 0
  end
end
