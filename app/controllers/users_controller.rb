class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @questions = @user.questions.order("created_at DESC")
    favorites = Favorite.where(user_id: @user.id).pluck(:question_id) 
    @favorite_list = Question.find(favorites) 
  end   
end
