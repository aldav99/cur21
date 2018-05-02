class Answer < ActiveRecord::Base
  belongs_to :question
  scope :vaild_answers, -> { where(correct: true) }
  validates :body, presence: true
end
