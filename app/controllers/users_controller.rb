class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @questions = @user.questions

    favorites = Favorite.where(user_id: current_user.id).pluck(:question_id) 
    @favorite_list = Question.find(favorites) 
  end   
end
