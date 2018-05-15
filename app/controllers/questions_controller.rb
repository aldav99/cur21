class QuestionsController < ApplicationController

  before_action :find_test, only: %i[new create]
  before_action :find_question, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
    @answers = @question.answers
  end

  def new
    @question = @test.questions.build
  end

  def create
    @question = @test.questions.create(question_params)
    redirect_to @test
  end

  def edit
    @test = @question.test
  end

  def update
    @question.update(question_params)
    redirect_to @question
  end

  def destroy
    test = Test.find(@question.test_id)
    @question.destroy
    redirect_to test
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
