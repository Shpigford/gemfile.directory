class GemfilesController < ApplicationController
  before_action :set_gemfile, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :authorize_user!, only: %i[edit update destroy]

  # GET /gemfiles or /gemfiles.json
  def index
    @gemfiles = Gemfile.all
  end

  # GET /gemfiles/1 or /gemfiles/1.json
  def show
  end

  # GET /gemfiles/new
  def new
    @gemfile = Gemfile.new
  end

  # GET /gemfiles/1/edit
  def edit
  end

  # POST /gemfiles or /gemfiles.json
  def create
    @gemfile = current_user.gemfiles.new(gemfile_params)

    respond_to do |format|
      if @gemfile.save
        format.html { redirect_to gemfile_url(@gemfile), notice: "Gemfile was successfully created." }
        format.json { render :show, status: :created, location: @gemfile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gemfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gemfiles/1 or /gemfiles/1.json
  def update
    respond_to do |format|
      if @gemfile.update(gemfile_params)
        format.html { redirect_to gemfile_url(@gemfile), notice: "Gemfile was successfully updated." }
        format.json { render :show, status: :ok, location: @gemfile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gemfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gemfiles/1 or /gemfiles/1.json
  def destroy
    @gemfile.destroy!

    respond_to do |format|
      format.html { redirect_to gemfiles_url, notice: "Gemfile was successfully destroyed." }
      format.json { head :no_content }
    end
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
