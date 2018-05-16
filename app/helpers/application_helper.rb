module ApplicationHelper

  def current_year
    Time.current.year
  end

  def github_link(author, repo)
    url = "https://github.com/#{author}/#{repo}"
    link_to "Проект TestGuru", url, target: "_blank"
  end
end
