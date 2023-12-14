class SearchController < ApplicationController
  def index
    @results = Gemfile.search(params[:query])
  end
end
