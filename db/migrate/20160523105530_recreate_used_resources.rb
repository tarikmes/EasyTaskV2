class RecreateUsedResources < ActiveRecord::Migration
  def change
    create_table "used_resources", force: :cascade do |t|
      t.integer  "used"
      t.integer  "task_id"
      t.integer  "resource_id"
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
    end
  end
end
