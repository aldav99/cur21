class CreateQuestionTests < ActiveRecord::Migration
  def change
    create_table :question_tests do |t|
      t.references :question, foreign_key: true
      t.references :test, foreign_key: true
      t.timestamps null: false
    end
  end
end
