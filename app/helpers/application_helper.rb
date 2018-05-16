module ApplicationHelper

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    url = "https://github.com/" + author.to_s + "/" + repo.to_s
    link_to "Проект TestGuru", url, target: "_blank"
  end
end
