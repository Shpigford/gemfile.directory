class PagesController < ApplicationController
  before_action :authenticate_user!, only: %i[dashboard]

  def home
  end

  def dashboard
  end
end
