class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.boolean :correct
      t.belongs_to :question

      t.timestamps null: false
    end
  end
end
