class AddColumnToBadge < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :title, :string
    add_column :badges, :imgfile, :string
    add_reference :badges, :category, foreign_key: true
    add_column :badges, :level, :integer
    add_column :badges, :try, :integer
  end
end
