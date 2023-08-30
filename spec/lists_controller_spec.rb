require 'rails_helper'
RSpec.describe ListsController, type: :request do
  describe 'GET index' do
    it 'renders the index template' do
      get '/lists'
      expect(response.code.to_i).to eq(200)
      expect(response).to render_template('index')
    end
  end

  describe 'GET  search' do
    before do
      stub_git_public_repos
    end
    it 'renders the index template with searched results' do
      get '/search', params: { 'page': '0', 'query': 'search' }
      byebug
      expect(response.code.to_i).to eq(200)
      expect(response).to render_template('index')
    end
  end
end
