class MyController < ApplicationController
  def favorite_gemfiles
    @favorite_gemfiles = current_user.favorite_gemfiles
    #current_user.favorites.map(&:favoritable).with_favorites
  end
end