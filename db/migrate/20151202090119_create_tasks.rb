class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
    	t.string "name", :limit => 100
    	t.string "description"
    	t.integer "estimate"
    	t.integer "user_id"
      t.integer "created_by"
      t.integer "task_status_id"
      t.timestamps null: false
    end
  end
end
