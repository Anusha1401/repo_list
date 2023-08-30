module StubHelper
  def stub_git_public_repos
    response_body = { total_count: 2, incomplete_results:  false, items: [{id: 1, name: 'hello', topics: ['h', 'e']}, {id: 2, name: 'hell', topics: ['he', 'e']}] }
    stub_request(:get, 'https://api.github.com/search/repositories?order=desc&q=search&sort=stars')
      .to_return(status: 200, body: response_body.to_json, headers: {})
  end
end
