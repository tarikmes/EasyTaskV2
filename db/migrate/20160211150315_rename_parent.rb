class RenameParent < ActiveRecord::Migration
  def change
    rename_column :tasks, :parent, :is_parent
  end
end
