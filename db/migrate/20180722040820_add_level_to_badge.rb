class AddLevelToBadge < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :level, :integer
  end
end
