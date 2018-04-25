class Test < ActiveRecord::Base
  belongs_to :category

  def self.tests_by_category(category)
    category_id = Category.find_by(title: category).id
    Test.order(title: :desc).where(category_id: category_id).pluck(:title)
  end
end
