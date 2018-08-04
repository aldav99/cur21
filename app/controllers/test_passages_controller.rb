class TestPassagesController < ApplicationController


  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]
  before_action :set_user, only: %i[show update result]
  
  def show
  end

  def result

    @result = (@test_passage.correct_questions.to_f/(@test_passage.test.questions.count)) * 100
  
    if @result < 85
      @test_passage.pass = false
      @test_passage.save!
      @color = "red"
      @text = "Тест не пройден. Вы набрали: "
    else
      @test_passage.pass = true
      @test_passage.save!
      add_badge
      @color = "green"
      @text = "Тест пройден. Вы набрали: "
    end
  end

  def first_try?(test)
    @test_passage.user.test_passages.where(test_id: test.id).one?
  end
  

  def save_badge(badge)
    @test_passage.user.badges << badge
    @test_passage.user.save
  end

  def add_badge_level(level, user, badge)
    tests_arr_id = Test.tests_by_level_id(level)
    tests_arr_id.each do |test_id|
      return unless TestPassage.test_pass?(test_id, user)
    end
    save_badge(badge)
  end

  def add_badge_category(category, user, badge)
    tests_arr_id = category.tests.pluck(:id)

    tests_arr_id.each do |test_id|
      return unless TestPassage.test_pass?(test_id, user)
    end

    save_badge(badge)
  end

  def add_badge_first_try(test, badge)
    save_badge(badge) if first_try?(test)
  end




  def add_badge
    user = @test_passage.user
    category = @test_passage.test.category
    level = @test_passage.test.level

    if badge = Badge.badge_by_level(level)
      add_badge_level(level, user, badge)
    end

    if badge = Badge.badge_by_category(category)
      add_badge_category(category, user, badge)
    end

    if badge = Badge.badge_first_try
      add_badge_first_try(@test_passage.test, badge)
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
