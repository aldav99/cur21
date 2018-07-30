class AddTryToBadge < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :try, :integer
  end
end
