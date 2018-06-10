class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable


  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :own_tests, class_name: "Test", foreign_key: "author_id"

  validates :email, format: { with: /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/i, message: "Внимательнее с форматом email" }
  validates :email, uniqueness: { message: "email д.б. уникальным" }
  
  def tests_by_level(level)
    tests.where(level: level).order(title: :desc).to_a
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def admin?
    self.type == 'Admin'
  end
end
