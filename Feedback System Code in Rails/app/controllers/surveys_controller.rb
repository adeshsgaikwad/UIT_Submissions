class SurveysController < ApplicationController

  def index
    # Code for listing all surveys goes here.
    @surveys = Survey.all
    render :index
  end

  def new
    # Code for new survey form goes here.
    @survey = Survey.new
    render :new
  end

  def create
    # Code for creating a new survey goes here.
    @survey = Survey.new(survey_params)
    if @survey.save
      flash[:notice] = "Feedback successfully added!"
      redirect_to surveys_path
    else
      flash[:alert] = "Feedback not added!"
      render :new
    end
  end

  def edit
    # Code for edit survey form goes here.
    @survey = Survey.find(params[:id])
    render :edit
  end

  def show
    # Code for showing a single survey goes here.
    @survey = Survey.find(params[:id])
    @questions = @survey.questions
    render :show
  end

  def update
    # Code for updating an survey goes here.
    @survey = Survey.find(params[:id])
    if @survey.update(survey_params)
      flash[:notice] = "Feedback successfully updated!"
      redirect_to surveys_path
    else
      render :edit
    end
  end

  def destroy
    # Code for deleting an survey goes here.
    @survey = Survey.find(params[:id])
    @survey.destroy
    flash[:notice] = "Feedback successfully deleted!"
    redirect_to surveys_path
  end


  private
    def survey_params
      params.require(:survey).permit(:name)
    end

end
