class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    @achievements = []
    Badge.all.each do |badge|
      @achievements.push(badge) if send("#{badge.rule_name}_passed?", badge.rule_value) && !@test_passage.user.badges.include?(badge)
    end
    @achievements
  end


  private

  def level_passed?(rule_value)
    tests_arr_id = Test.tests_by_level_id(rule_value)
    tests_arr_id.each do |test_id|
      return unless TestPassage.where(test_id: test_id, user_id: @test_passage.user).passed.present?
    end
  end

  def category_passed?(rule_value)
    category = Category.find_by_title(rule_value)

    tests_arr_id = category.tests.pluck(:id)

    tests_arr_id.each do |test_id|
      return unless TestPassage.where(test_id: test_id, user_id: @test_passage.user).passed.present?
    end
  end

  def try_passed?(rule_value = "")
    @test_passage.user.test_passages.where(test_id: @test_passage.test.id).one?
  end
end

