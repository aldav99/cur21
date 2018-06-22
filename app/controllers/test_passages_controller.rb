class TestPassagesController < ApplicationController


  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]
  
  def show
  end

  def result
    
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    description = t('.gist_description', test: @test_passage.current_question.test.title)

    result = GistQuestionService.new(@test_passage.current_question, description).call
    
    flash_options = unless result.nil?

      @gists = Gist.new

      @gists.question = @test_passage.current_question.body
      @gists.gist_url = result[:url]
      @gists.user = @test_passage.user.email

      @gists.save

      str = t('.success') + "   #{result[:html_url]}"

      { notice: str }
    else
      { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
