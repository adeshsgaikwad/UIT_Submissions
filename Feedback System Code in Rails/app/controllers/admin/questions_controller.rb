class Admin::QuestionsController < ApplicationController

  def index
    # Code for listing all questions goes here.
    @questions = Question.all
    render :index
  end

  def new
    # Code for new question form goes here.
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.new
    render :new
  end

  def create
    # Code for creating a new question goes here.
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.new(question_params)
    if @question.save
      flash[:notice] = "Question successfully created!"
      redirect_to survey_path(@survey)
    else
      render :new
    end
  end

  def edit
    # Code for edit question form goes here.
    @survey = Survey.find(params[:survey_id])
    @question = Question.find(params[:id])
    render :edit
  end

  def show
    # Code for showing a single question goes here.
    @survey = Survey.find(params[:survey_id])
    @question = Question.find(params[:id])
    @questions = @survey.questions
    render :show
  end

  def update
    # Code for updating an question goes here.
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "Question successfully updated!"
      redirect_to survey_question_path(@survey, @question)
    else
      flash[:alert] = "Question not updated!"
      render :edit
    end
  end

  def destroy
    # Code for deleting an question goes here.

    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "Question successfully deleted!"
    redirect_to survey_path(@question.survey)
  end

  private
    def question_params
      params.require(:question).permit(:text, :answer1, :answer2, :answer3, :answer4)
    end

end
