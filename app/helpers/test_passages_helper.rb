module TestPassagesHelper

  def result_html(result)

    if result < 85
      html = "<b>Тест не пройден. Вы набрали: <font color = 'red'>#{result.to_i}</font> </b>"
    else
      html = "<b>Тест пройден. Вы набрали: <font color = 'green'>#{result.to_i}</font> </b>"
    end
    html.html_safe
  end
end




