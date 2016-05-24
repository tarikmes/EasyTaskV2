class DeleteUsedResourcesFromResources < ActiveRecord::Migration
  def change
        remove_column :resources, :used_resources, :string
  end
end
