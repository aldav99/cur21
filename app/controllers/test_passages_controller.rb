class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show update result]
  before_action :current_question_number, only: %i[update]
  
  def show
    @current_question_number = 1
  end

  def result
    
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    
    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def current_question_number
    @current_question_number ||= 1
    @current_question_number += 1
  end
end
