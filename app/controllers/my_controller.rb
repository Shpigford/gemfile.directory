class MyController < ApplicationController
  def favorite_gemfiles
    @favorite_gemfiles = current_user.favorite_gemfiles
  end
end
