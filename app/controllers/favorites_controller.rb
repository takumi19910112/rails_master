class FavoritesController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    current_user.favorite(@question)
  end

  def destroy
    @question = current_user.favorite_questions.find(params[:id])
    current_user.unfavorite(@question)
  end


end