class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level
      t.references :category, foreign_key: true
      t.references :author
      t.timestamps null: false
    end
  end
end
