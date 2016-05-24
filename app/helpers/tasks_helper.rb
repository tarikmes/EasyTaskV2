module TasksHelper

  def tasktest
    tasks.status(1).count
  end
end
