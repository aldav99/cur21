class DropTableTestsUsers < ActiveRecord::Migration[5.2]
  def up
    drop_table :user_tests, if_exists: true 
  end
end
