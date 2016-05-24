class UsedResource < ActiveRecord::Base
  belongs_to :task
  belongs_to :resource

  scope :created_at_range, -> (start_date, end_date) {where "created_at > ? AND created_at < ?", start_date.beginning_of_day, end_date.end_of_day}
  scope :used_for_task, -> (task_id) { where task_id: task_id }
end
