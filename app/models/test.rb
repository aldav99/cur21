class Test < ActiveRecord::Base
  belongs_to :category
  belongs_to :author, class_name: "User"
  has_many :user_tests
  has_many :users, through: :user_tests
  has_many :questions
  
  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  
  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title, uniqueness: { scope: :level, message: "Пара название - уровень д.б. уникальна" }
  

  def self.tests_by_category(category)
    joins(:category).where(categories: { title: category}).order(title: :desc).pluck(:title)
  end
end
