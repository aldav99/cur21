class QuestionsController < ApplicationController

  before_action :find_test
  before_action :find_question, only: %i[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    result = @test.questions.pluck(:id, :body)
    render plain: result.join("\n")
  end

  def show
    @question = find_question
    @answers = @question.answers
  end

  def new
    @question = @test.questions.build
  end

  def create
    @question = @test.questions.create(question_params)
    render plain: @question.inspect
  end

  def destroy
    question = find_question
    question.destroy
    redirect_to root_path
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
