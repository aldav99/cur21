class TestPassagesController < ApplicationController


  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]
  before_action :set_user, only: %i[show update result]
  
  def show
  end

  def result
    if @test_passage.success?
      @test_passage.finish!
      achievements = BadgeService.new(@test_passage).call
      @test_passage.user.badges.push(achievements)
      @test_passage.user.save
    end
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

    result = GistQuestionService.new(@test_passage.current_question).call
    

    current_user.gists.create(question: @test_passage.current_question, gist_url: result[:url])

    flash_options = { notice: "#{t('.success')}  #{result[:html_url]}" }

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def set_user
    @user = TestPassage.find(params[:id]).user
  end

end
