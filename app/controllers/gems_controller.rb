class GemsController < ApplicationController
  def index
  end

  def show
    @gem = AppGem.find_by(name: params[:id])
    if @gem
      @gemfiles = @gem.gemfiles
    else
      redirect_to root_path, notice: "Gem not found"
    end
  end
end
