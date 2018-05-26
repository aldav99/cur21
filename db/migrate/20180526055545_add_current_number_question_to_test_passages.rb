class AddCurrentNumberQuestionToTestPassages < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :current_number_question, :integer
  end
end
