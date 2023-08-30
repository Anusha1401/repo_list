# Controller used to get all public repositories based of searched key
class ListsController < ApplicationController
  before_action :initialize_page_params, only: :search

  def index; end

  def search
    search_term = params[:query]
    repo = RepoService.new(search_term)
    @lists = repo.repository_lists.paginate(page: @page, per_page: 10)
    render 'index'
  end

  private

  def initialize_page_params
    @page  = params[:page].to_i.zero? ? 1 : params[:page].to_i.abs
  end
end
