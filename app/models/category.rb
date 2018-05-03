class Category < ActiveRecord::Base
  default_scope { order(title: :asc) }

  has_many :tests
  
  validates :title, presence: true
end
