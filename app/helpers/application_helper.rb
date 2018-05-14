module ApplicationHelper

  def year
    Time.now.year
  end

  def github_url(author, repo)
    'https://github.com/' + author.to_s + '/' + repo.to_s
  end
end
