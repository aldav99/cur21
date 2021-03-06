class CreateTestPassages < ActiveRecord::Migration[5.2]
  def change
    create_table :test_passages do |t|
      t.references :user, index: true, foreign_key: true
      t.references :test, index: true, foreign_key: true
      t.references :current_question, index: true
      t.integer :correct_questions, default: 0

      t.timestamps null: false
    end
  end
end
