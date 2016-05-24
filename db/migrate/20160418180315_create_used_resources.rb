class CreateUsedResources < ActiveRecord::Migration
  def change
    create_table :used_resources do |t|
      t.integer :used
      t.references :task, index: true, foreign_key: true
      t.references :resource, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
