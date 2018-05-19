class DropTableTestsUsers < ActiveRecord::Migration
  def up
    drop_table :user_tests, if_exists: true 
  end
end
