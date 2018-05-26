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

  def completed?
    current_question.nil?
  end

  def result
    (correct_questions.to_f/test.questions.count) * 100
  end

  def set_color(color)
    @color = color
  end

  def color
    @color
  end

  def evaluate_result
    if result < 85
      set_color("red")
      "Тест не пройден. Вы набрали: "
    else
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
  end

  def set_next_question
    self.current_question = next_question
  end
  
end
