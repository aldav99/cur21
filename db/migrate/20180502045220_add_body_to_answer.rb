class AddBodyToAnswer < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :body, :text
  end
end
