class Badge < ApplicationRecord

  has_many :user_badges
  has_many :users, through: :user_badges

  def self.badge_by_level(level)
    where(rule_name: "level", rule_value: level).first
  end

  def self.badge_by_category(category)
    where(rule_name: "category", rule_value: category.title).first
  end


  def self.badge_first_try
    where(rule_name: "try", rule_value: '1').first
  end

end
