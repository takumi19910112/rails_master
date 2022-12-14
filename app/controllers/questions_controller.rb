class QuestionsController < ApplicationController
   before_action :set_question, only: [:edit, :show,:update]
 
  def index
    @questions = Question.includes(:user).page(params[:page]).per(4).order("created_at DESC")
  
    
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
    impressionist(@question, nil, :unique => [:ip_address]) 
   
 
    @comment  = Comment.new
    @comments = @question.comments
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
     if question.user != current_user
      redirect_to  root_path
    else
      question.destroy
      redirect_to root_path
    end
 end

 

 def search
  @questions = Question.search(params[:keyword]).order("created_at DESC")
end

  private

  def question_params
    params.require(:question).permit(:tag_id,:title,:content,{images: []}).merge(user_id: current_user.id)
  end

  def set_question
    @question = Question.find(params[:id])
  end

end
