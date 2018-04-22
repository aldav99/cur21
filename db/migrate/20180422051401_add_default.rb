class AddDefault < ActiveRecord::Migration
  def up
    change_column_default(:tests, :level, 0)
    change_column_default(:answers, :correct, false)
  end

  def down
    change_column_default(:tests, :level, nil)
    change_column_default(:answers, :correct, nil)
  end
end
