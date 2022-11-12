class FavoritesController < ApplicationController
  before_action :question_find
 

  def create
    Favorite.create(user_id: current_user.id, question_id: params[:id])
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, question_id: params[:id])
    favorite.destroy
  end

  private

  def question_find
    # 投稿内容の取得
    @question = Question.find(params[:id])
  end

end