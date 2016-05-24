class Task < ActiveRecord::Base
	belongs_to :user
	belongs_to :task_status
  has_many :comments
  has_many :used_resources
  #has_many :resources, :through => :used_resources
  has_many :subs, class_name: "Task", foreign_key: "parent_task_id" 
  belongs_to :parent, class_name: "Task"

  accepts_nested_attributes_for :used_resources
  #accepts_nested_attributes_for :resources
  
	scope :user_id, -> (user_id) { where user_id: user_id }
  scope :status, -> (task_status_id) { where task_status_id: task_status_id }
  scope :created_by, -> (user_id) { where created_by: user_id }
  scope :is_parent, -> (is_parent) {where is_parent: is_parent}
  scope :created_at_range, -> (start_date, end_date) { where "created_at > ? AND created_at < ?",start_date.beginning_of_day, end_date.end_of_day}

end
