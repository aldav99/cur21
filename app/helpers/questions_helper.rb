module QuestionsHelper

  def question_header
    Test.find(@question.test_id).title
  end
end
