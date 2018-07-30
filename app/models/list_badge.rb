class ListBadge < ApplicationRecord
  belongs_to :category

  def self.badge_by_level(level)
    ListBadge.find_by(level: level)
  end
end
