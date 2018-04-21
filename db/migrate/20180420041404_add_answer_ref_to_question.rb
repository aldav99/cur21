class AddAnswerRefToQuestion < ActiveRecord::Migration
  def change
    add_reference :questions, :answer, index: true, foreign_key: true
  end
end
