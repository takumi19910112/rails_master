class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @questions = @user.questions.order("created_at DESC")
 

    bookmarks = Bookmark.where(user_id: current_user.id).pluck(:question_id)
    @bookmark_list = Question.find(bookmarks)

  end   

  def favorites

    @user = User.find(params[:id])
    favorites= Favorite.where(user_id: @user.id).pluck(:question_id)
    @favorite_questions = Question.find(favorites)
  end

end
