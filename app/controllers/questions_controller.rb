class QuestionsController < ApplicationController

  before_action :find_test_by_question, only: %i[destroy]
  before_action :find_question, only: %i[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    test = find_test
    result = test.questions.pluck(:id, :body)
    render plain: result.join("\n")
  end

  def show
    @question = find_question
    @answers = @question.answers
  end

  def new
    @test = find_test
    @question = @test.questions.build
  end

  def create
    @test = find_test
    @question = @test.questions.build(question_params)
    @question.save
    render plain: @question.inspect
  end

  def destroy
    question = find_question
    question.destroy
    redirect_to root_path
  end

  private

  def find_test
    Test.find(params[:test_id])
  end

  def find_test_by_question
    @test = Test.joins(:questions).where(questions: {test_id: params[:id]}).first
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
