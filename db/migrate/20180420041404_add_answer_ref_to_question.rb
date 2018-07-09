class AddAnswerRefToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :answer, index: true, foreign_key: true
  end
end
