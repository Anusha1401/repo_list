# Service used to get array of public git repositories from GitHub
# Input: search key
# Output: Array of public repositories
class RepoService
  require 'uri'
  require 'net/https'

  def initialize(search_key)
    @search_key = search_key
  end

  def repository_lists
    git_repos
  end

  def git_repos
    uri = URI(GIT_BASE_URL)
    params = { q: @search_key, sort: 'stars', order: 'desc' }
    uri.query = URI.encode_www_form(params)
    response = Net::HTTP.get_response(uri)
    return JSON.parse(response.body)['items'] if response.code.to_i == 200

    []
  rescue StandardError
    []
  end
end
