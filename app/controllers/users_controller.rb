class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @questions = @user.questions.order("created_at DESC")
 

    

  end   

  def favorites
    @user = User.find(params[:id])
    favorites= Favorite.where(user_id: @user.id).order("created_at DESC").pluck(:question_id)
    @favorite_questions = Question.find(favorites)
  end

  def bookmarks
    @user = User.find(params[:id])
    bookmarks= Bookmark.where(user_id: @user.id).order("created_at DESC").pluck(:question_id)
    @bookmark_questions = Question.find(bookmarks)
  end

end
