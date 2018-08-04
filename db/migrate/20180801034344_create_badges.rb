class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :title
      t.string :imgfile
      t.string :rule_name
      t.string :rule_value

      t.timestamps
    end
  end
end
