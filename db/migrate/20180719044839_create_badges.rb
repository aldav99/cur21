class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :title
      t.string :imgfile
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
