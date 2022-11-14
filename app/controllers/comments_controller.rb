class CommentsController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @comment = @question.comments.new(comment_params)
    if @comment.save
      CommentChannel.broadcast_to @question, { comment: @comment, user: @comment.user } 
    else
      @comments = @question.comments.includes(:user)
      render "questions/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:message).merge(user_id: current_user.id,question_id: params[:question_id])
  end
end

