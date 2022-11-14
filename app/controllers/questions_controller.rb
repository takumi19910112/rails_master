class QuestionsController < ApplicationController
   before_action :set_question, only: [:edit, :show,:update]
 
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
  end

  def show
  
    @comment  = Comment.new
    @comments = @question.comments.includes(:udser)
    question  = Question.find(params[:id])
  end
  
  def edit

     unless user_signed_in? && current_user.id == @question.user_id
      redirect_to action: :index
     end 
  end
  
 def update

     if @question.update(question_params)
      redirect_to question_path
     else
      render :edit
      end
 end
  
 def destroy
     question = Question.find(params[:id])
     question.destroy
     redirect_to root_path
 end



  private

  def question_params
    params.require(:question).permit(:tag_id,:title,:content).merge(user_id: current_user.id)
  end

  def set_question
    @question = Question.find(params[:id])
  end

end
