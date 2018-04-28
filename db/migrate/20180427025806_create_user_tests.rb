class CreateUserTests < ActiveRecord::Migration
  def change
    create_table :user_tests do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true

      t.timestamps null: false
    end
  end
end
