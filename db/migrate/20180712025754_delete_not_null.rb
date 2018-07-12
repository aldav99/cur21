class DeleteNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :name, true
  end
end
