class AddBadgeToCategory < ActiveRecord::Migration[5.2]
  def change
    add_reference :badges, :category, foreign_key: true
  end
end
