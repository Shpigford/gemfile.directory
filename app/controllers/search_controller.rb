class SearchController < ApplicationController
  def index
    @results = Gemfile.with_favorites.search(params[:query])
  end
end
