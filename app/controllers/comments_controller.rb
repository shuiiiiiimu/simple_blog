class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    @comment = Comment.new(comment_params)
    @comment.topic = Topic.find(params[:topic_id])
    @comment.user = current_user
    @success = @comment.save
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end

end
