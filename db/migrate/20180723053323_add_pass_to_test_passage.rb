class AddPassToTestPassage < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :pass, :boolean
  end
end
