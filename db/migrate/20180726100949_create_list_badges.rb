class CreateListBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :list_badges do |t|
      t.string :title
      t.string :imgfile
      t.integer :level
      t.integer :try
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
