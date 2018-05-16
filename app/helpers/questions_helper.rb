module QuestionsHelper

  def question_header(question)
    
    if question.new_record?
      return "Create New #{question.test.title} Question"
    else
      return "Edit #{question.test.title} Question"
    end
  end
end
