class Answer < ApplicationRecord
  belongs_to :question
  
  scope :correct, -> { where(correct: true) }
  
  validates :body, presence: true

  validate :number_answers_valid?, on: :create

  def number_answers_valid?
    if Answer.where(question_id: self.question_id).count == 4
      errors.add(:number_answers, "Кол-во ответов от 1 до 4")
    end
  end
end
