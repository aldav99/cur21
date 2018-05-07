class QuestionsController < ApplicationController

  before_action :find_test, only: %i[delete]
  before_action :find_question, only: %i[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    result = Question.where(test_id: params[:test_id]).pluck(:id, :body)
    render plain: result.join("\n")
  end

  def show
   result = Answer.where(question_id: params[:id]).pluck(:body)
   render plain: result.join("\n")
  end

  def new
    
  end

  def create
    question = Question.create(question_params)
    question[:test_id] = params[:test_id]
    question.save
    render plain: question.inspect
  end

  def delete
    question = Question.find(params[:id])
    question.destroy!
    redirect_to "/tests/#{@test.id}/questions"
  end

  private

  def find_test
    @test = Test.joins(:questions).where(questions: {test_id: 1}).first
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
