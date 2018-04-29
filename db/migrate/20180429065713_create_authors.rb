class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true

      t.timestamps null: false
    end
  end
end
