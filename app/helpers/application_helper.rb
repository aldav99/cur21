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
      flash.each do |key, message|
        <p class="flash alert">message</p>
      end
    end
  end
end

