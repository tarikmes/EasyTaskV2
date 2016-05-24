class DropTableUsedResources < ActiveRecord::Migration
  def change
    drop_table :used_resources
  end
end
