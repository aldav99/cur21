class User < ActiveRecord::Base
  has_many :tests

  def find_tests_level(level)
    Test.where("user_id = ? AND level = ?", self.id, level).pluck(:title).join(",")
  end
end
