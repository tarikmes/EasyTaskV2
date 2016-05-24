class Resource < ActiveRecord::Base
  has_many :used_resources, :class_name => "UsedResource", foreign_key: "resource_id" 
end
