class AddIsParentTicketToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :parent, :boolean, :default => false
  end
end
