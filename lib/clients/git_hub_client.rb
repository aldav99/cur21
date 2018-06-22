class GitHubClient


  def initialize
    @client = Octokit::Client.new(:access_token => ENV['OCTOKIT_ACCESS_TOKEN'])
  end

  def create_gist(params)
    @client.create_gist(params.to_json)
  end

end
