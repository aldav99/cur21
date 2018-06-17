module QuestionsHelper

  def question_header(question)
    
    if question.new_record?
      t('helper_create', title: question.test.title)
    else
      t('helper_edit', title: question.test.title)
    end
  end
end


