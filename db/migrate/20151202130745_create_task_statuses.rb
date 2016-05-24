class CreateTaskStatuses < ActiveRecord::Migration
  def change
    create_table :task_statuses do |t|
      t.string 'name', :limit => 50

      t.timestamps null: false
    end
  end
end
