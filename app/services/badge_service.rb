class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    @result = (@test_passage.correct_questions.to_f/(@test_passage.test.questions.count)) * 100
  
    if @result < 85
      @test_passage.pass = false
      @test_passage.save!
    else
      @test_passage.pass = true
      @test_passage.save!
      add_badge
    end
    @result
  end

  private

  def level_passed?(rule_value)
    tests_arr_id = Test.tests_by_level_id(rule_value)
    tests_arr_id.each do |test_id|
      return unless TestPassage.test_pass?(test_id, @test_passage.user)
    end
  end

  def category_passed?(rule_value)
    category = Category.find_by_title(rule_value)

    tests_arr_id = category.tests.pluck(:id)

    tests_arr_id.each do |test_id|
      return unless TestPassage.test_pass?(test_id, @test_passage.user)
    end
  end

  def try_passed?(rule_value = "")
    @test_passage.user.test_passages.where(test_id: @test_passage.test.id).one?
  end

  def add_badge
    Badge.all.to_a.each do |badge|
      (@test_passage.user.badges << badge) if send("#{badge.rule_name}_passed?", badge.rule_value) && !@test_passage.user.badges.include?(badge)
      @test_passage.user.save
    end
  end

end

