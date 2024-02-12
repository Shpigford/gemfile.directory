class GemfilesController < ApplicationController
  before_action :set_gemfile, only: %i[ show edit update destroy favorite unfavorite gems_details]
  before_action :authenticate_user!, only: %i[new create edit update destroy favorite unfavorite]
  before_action :authorize_user!, only: %i[edit update destroy]

  def index
    @gemfiles = Gemfile.with_favorites
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

    # Parse the contents of the gemfile and create a new AppGem for each gem, or find the existing AppGem if it already exists and associate it with the gemfile
    @gemfile.parse_content

    if @gemfile.save
      redirect_to gemfile_url(@gemfile), notice: "Gemfile was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    # Count the number of gem's in the "content" param based on the number of lines that start with "gem"
    @gemfile.gem_count = @gemfile.count_gems

    @gemfile.parse_content

    if @gemfile.update(gemfile_params)
      redirect_to gemfile_url(@gemfile), notice: "Gemfile was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @gemfile.destroy!

    redirect_to gemfiles_url, notice: "Gemfile was successfully destroyed."
  end

  def favorite
    current_user.favorites.create(favoritable: @gemfile)
    render partial: "gemfiles/favorite", locals: { gemfile: @gemfile }
  end

  def unfavorite
    current_user.favorites.find_by(favoritable: @gemfile).destroy
    render partial: "gemfiles/favorite", locals: { gemfile: @gemfile }
  end

  def gems_details
    json = {}.tap do |res|
      @gemfile.app_gems.select("details ->> 'info' as info, name").each do |gem|
        res[gem.name] = gem.info
      end
    end.to_json

    render json:
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gemfile
      @gemfile = Gemfile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gemfile_params
      params.require(:gemfile).permit(:content, :name, :app_link, :github_link, :notes)
    end

    def authorize_user!
      unless @gemfile.user == current_user
        redirect_to gemfiles_path, alert: "You are not authorized to perform this action."
      end
    end
end
