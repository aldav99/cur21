module ApplicationHelper

  def current_year
    Time.current.year
  end

  def github_link(author, repo)
    url = "https://github.com/#{author}/#{repo}"
    link_to "Проект TestGuru", url, target: "_blank"
  end

  def flash_alert
    unless flash.empty?
      html = ""
      flash.each do |key, msg|
        html << (content_tag :p, msg, :class => 'flash alert')
      end
      html.html_safe
    end
  end

end

