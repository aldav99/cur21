class Question < ActiveRecord::Base
  belongs_to :test
  has_many :answers
  validates :body, presence: true

  validate :number_answers_valid?
  

  def number_answers_valid?
    if answers.count < 1 || answers.count > 4
      errors.add(:number_answers, "Кол-во ответов от 1 до 4")
    end
  end
end
