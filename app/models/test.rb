class Test < ActiveRecord::Base
  belongs_to :category
  has_many :user_tests
  has_many :users, through: :user_tests
  has_and_belongs_to_many :questions
  belongs_to :user

  def self.tests_by_category(category)
    joins("INNER JOIN categories ON categories.id = tests.category_id").where(categories: { title: category}).order(title: :desc).pluck(:title)
  end
end
