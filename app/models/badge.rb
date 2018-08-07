class Badge < ApplicationRecord

  has_many :user_badges
  has_many :users, through: :user_badges

  def self.badge_by_category(category)
    where(rule_name: "category", rule_value: category.title).first
  end

end
