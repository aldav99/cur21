class Category < ApplicationRecord
  default_scope { order(title: :asc) }

  has_many :tests
  
  validates :title, presence: true

  def self.find_by_title(title)
    find_by(title: title)
  end

end
