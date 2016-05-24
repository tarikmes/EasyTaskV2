class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string "name", :limit => 100
      t.string "used_resources"
      t.timestamps null: false
    end
  end
end
