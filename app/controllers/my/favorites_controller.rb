class My::FavoritesController < ApplicationController
  def index
    @favorite_gemfiles = current_user.favorite_gemfiles
  end
end
