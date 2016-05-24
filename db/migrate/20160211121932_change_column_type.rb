class ChangeColumnType < ActiveRecord::Migration
  def change
    change_column :tasks, :parent, :integer
  end
end
