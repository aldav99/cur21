module ApplicationHelper

  def current_year
    Time.current.year
  end

  def github_link(author, repo)
    url = "https://github.com/#{author}/#{repo}"
    link_to "Проект TestGuru", url, target: "_blank"
  end

  def flash_alert
      html = ""
      flash.each do |key, msg|
        html << (content_tag :div, msg, :class => ['alert alert-danger', 'row justify-content-center'], :role => 'alert')
      end
      html.html_safe
  end

  

end

