class AddNullConstraints < ActiveRecord::Migration[5.2]
  def change
    change_column_null :categories, :title, false
    change_column_null :questions, :body, false
    change_column_null :tests, :title, false
  end
end
