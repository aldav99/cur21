class TestPassagesController < ApplicationController


  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]
  before_action :set_user, only: %i[show update result]
  before_action :time_test_passage, only: %i[show update gist]
  before_action :set_time, only: %i[show update]
  
  def show
    @time_left = @set_time
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
    @time_left = @set_time - @test_passage.updated_at.to_i + @test_passage.created_at.to_i
    
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

  def time_test_passage
    redirect_to result_test_passage_path(@test_passage) if @test_passage.test_time_expired?
  end

  def set_time
    @set_time = @test_passage.test.timer * 60
  end
end
