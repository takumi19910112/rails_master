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

end
