class FavoritesController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    favorite = @question.favorites.new(user_id: current_user.id)
    favorite.save
    flash[:success] = "Liked post"
    redirect_to request.referer
  end

  def destroy
    @question = Question.find(params[:question_id])
    favorite = current_user.favorites.find_by(question_id: @question.id)
    favorite.destroy
    redirect_to request.referer
  end

end