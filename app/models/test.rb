class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"
  
  has_many :test_passages
  has_many :users, through: :test_passages
  has_many :questions
  
  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_category, -> (category) { joins(:category).where(categories: { title: category}).order(title: :desc) }
  
  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title, uniqueness: { scope: :level, message: "Пара название - уровень д.б. уникальна" }
  

  def self.tests_by_category(category)
    by_category(category).pluck(:title)
  end
end
