class QuestionsController < ApplicationController
  def index
    @questions = Question.includes(:user).order("created_at DESC")
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_path
    else
      render :new
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
    prototype = Prototype.find(params[:id])
  end
  
  def edit
    @prototype = Prototype.find(params[:id])
     unless user_signed_in? && current_user.id == @prototype.user_id
      redirect_to action: :index
     end 
  end
  
 def update
    @prototype = Prototype.find(params[:id])
     if @prototype.update(prototype_params)
      redirect_to prototype_path
     else
      render :edit
      end
 end
  
 def destroy
     prototype = Prototype.find(params[:id])
     prototype.destroy
     redirect_to root_path
 end

end

  private

  def question_params
    params.require(:question).permit(:tag_id,:title,:content,).merge(user_id: current_user.id)
  end


end
