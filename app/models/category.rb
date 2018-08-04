class Category < ApplicationRecord
  default_scope { order(title: :asc) }

  has_many :tests
  
  validates :title, presence: true

  def badge_by_category
    self.list_badges.first if self.list_badges.any?
  end

end
