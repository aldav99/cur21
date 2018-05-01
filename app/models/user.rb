class User < ActiveRecord::Base
  
  has_many :user_tests
  has_many :tests, through: :user_tests
  has_many :authors, class_name: "Test", foreign_key: "author_id"

  def tests_by_level(level)
    tests.where(level: level).order(title: :desc).to_a
  end
end
