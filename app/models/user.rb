class User < ActiveRecord::Base
	has_secure_password
	has_many :tasks
	belongs_to :user_type

  def task_status_count(status)
    self.tasks.status(status).count
  end

  #validates :password, presence: true


  #validates :password, confirmation: true

  validates :password, presence: true, confirmation: true, :unless => :already_has_password?   

private
    def already_has_password?
      !self.password_digest.blank?
    end

end
