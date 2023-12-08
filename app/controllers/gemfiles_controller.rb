class GemfilesController < ApplicationController
  before_action :set_gemfile, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :authorize_user!, only: %i[edit update destroy]

  def index
    @gemfiles = Gemfile.all
  end

  def show
  end

  def new
    @gemfile = Gemfile.new
  end

  def edit
  end

  def create
    @gemfile = current_user.gemfiles.new(gemfile_params)

    # Count the number of gem's in the "content" param based on the number of lines that start with "gem" (account for empty spaces)
    @gemfile.gem_count = @gemfile.count_gems
    
    if @gemfile.save
      redirect_to gemfile_url(@gemfile), notice: "Gemfile was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    # Count the number of gem's in the "content" param based on the number of lines that start with "gem"
    @gemfile.gem_count = @gemfile.count_gems

    if @gemfile.update(gemfile_params)
      @gemfile.save

      redirect_to gemfile_url(@gemfile), notice: "Gemfile was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @gemfile.destroy!

    redirect_to gemfiles_url, notice: "Gemfile was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gemfile
      @gemfile = Gemfile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gemfile_params
      params.require(:gemfile).permit(:content, :name, :app_link, :github_link)
    end

    def authorize_user!
      unless @gemfile.user == current_user
        redirect_to gemfiles_path, alert: 'You are not authorized to perform this action.'
      end
    end
end