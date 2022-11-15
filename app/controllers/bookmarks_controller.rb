  class BookmarksController < ApplicationController
    def create
      @question = Question.find(params[:question_id])
      bookmark = @question.bookmarks.new(user_id: current_user.id)
      bookmark.save
      flash[:success] = "Liked post"
      redirect_to request.referer
    end
  
    def destroy
      @question = Question.find(params[:question_id])
      bookmark = current_user.bookmarks.find_by(question_id: @question.id)
      bookmark.destroy
      redirect_to request.referer
    end
end
