class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  after_validation :set_next_question, on: :update

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def self.test_pass?(test_id, user)
    TestPassage.where(test_id: test_id, user_id: user).order(:created_at).pluck(:pass).last
  end

  def completed?
    current_question.nil?
  end

  def result
    (correct_questions.to_f/test.questions.count) * 100
  end

  def save_badge(list_badge)
    self.user.badges.create(title: list_badge.title,
                            imgfile: list_badge.imgfile,
                            category_id: list_badge.category_id,
                            level: list_badge.level,
                            try: list_badge.try)
    self.user.save
  end

  def add_badge_category_to_user
    @user = self.user
    category = test.category
   
    if @list_badge = category.badge_by_category
      tests_arr_id = category.tests.pluck(:id)

      tests_arr_id.each do |test_id|
        return unless TestPassage.test_pass?(test_id, @user)
      end

      save_badge(@list_badge)
    end
  end


  

  def add_badge_level_to_user
    @user = self.user
    level = test.level
    
    if @list_badge = ListBadge.badge_by_level(level)

      tests_arr_id = Test.tests_by_level_id(level)

      tests_arr_id.each do |test_id|
        return unless TestPassage.test_pass?(test_id, @user)
      end
    

      save_badge(@list_badge)
    end
  end

  def first_try?
    self.user.test_passages.where(test_id: test.id).one?
  end

  def add_badge_first_try

    if @list_badge = ListBadge.find_by(try: 1)
      save_badge(@list_badge) if first_try?
    end

  end
  

  def set_color(color)
    @color = color
  end

  def color
    @color
  end

  def evaluate_result
    if result < 85
      self.pass = false
      save!
      set_color("red")
      "Тест не пройден. Вы набрали: "
    else
      self.pass = true
      save!
      add_badge_first_try
      add_badge_category_to_user
      add_badge_level_to_user
      set_color("green")
      "Тест пройден. Вы набрали: "
    end
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
    self.current_number_question = 1
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    self.current_number_question += 1
    test.questions.order(:id).where('id > ?', current_question.id).first
    rescue
      nil
  end

  def set_next_question
    self.current_question = next_question
  end
  
end

