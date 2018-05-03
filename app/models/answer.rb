class Answer < ActiveRecord::Base
  belongs_to :question
  
  scope :vaild, -> { where(correct: true) }
  
  validates :body, presence: true

  validate :number_answers_valid?, on: :create

  def number_answers_valid?
    if Answer.joins(:question).where( questions: { id: question.id}).count == 4
      errors.add(:number_answers, "Кол-во ответов от 1 до 4")
    end
  end
end
