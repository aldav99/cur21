class AddUserToTest < ActiveRecord::Migration
  def change
    add_reference :tests, :user
  end
end
