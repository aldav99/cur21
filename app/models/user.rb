class User < ActiveRecord::Base
  
  has_many :user_tests
  has_many :tests, through: :user_tests

  def list_tests_level(level)
    tests.where("level = ?", level).order(title: :desc).pluck(:title).join(",")
  end
end
