class QuestionsController < ApplicationController

  before_action :find_test, only: %i[new, create]
  before_action :find_question, only: %i[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @test = find_test
    result = @test.questions.pluck(:id, :body)
    render plain: result.join("\n")
  end

  def show
    @question = find_question
    @answers = @question.answers
  end

  def new
    # без следующей строки появляется 
    # Question was not found
    @test = find_test
    @question = @test.questions.build
  end

  def create
    @question = @test.questions.create(question_params)
    redirect_to @test
  end

  def edit
    @question = find_question
    @test = Test.find(@question.test_id)
  end

  def update
    @question = find_question
    @question.update(question_params)
    redirect_to @question
  end

  def destroy
    question = find_question
    test = Test.find(question.test_id)
    question.destroy
    redirect_to test
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
