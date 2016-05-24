class CommentsController < ApplicationController
  def create
    @task = Task.find(params[:task_id])
    @comment = @task.comments.create(comment_params)
    respond_to do |format|
    format.html { render :nothing => true }
    format.js
    end
  end

  def new
    @comment = Comment.new
      respond_to do |format|
    format.html
    format.js
  end
  end

private
    def comment_params
      params.require(:comment).permit(:body, :created_by)
    end
end
