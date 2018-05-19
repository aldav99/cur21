class User < ActiveRecord::Base
  
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :own_tests, class_name: "Test", foreign_key: "author_id"
  
  validates :email, presence: true

  def tests_by_level(level)
    tests.where(level: level).order(title: :desc).to_a
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
