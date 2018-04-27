class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level
      t.belongs_to :category, index: true
      
      t.timestamps null: false
    end
  end
end
