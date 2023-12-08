class Gemfile < ApplicationRecord
  belongs_to :user
  has_many :favorites, as: :favoritable, dependent: :destroy
  has_many :gemfile_app_gems
  has_many :app_gems, through: :gemfile_app_gems

  def count_gems
    self.content.split("\n").select { |line| line.strip.start_with?("gem") }.count
  end

  def parse_content
    # First delete all existing AppGem associations from gemfile_app_gems
    self.gemfile_app_gems.destroy_all

    self.content.split("\n").each do |line|
      if line.strip.start_with?("gem")
        gem_name = line.strip.split(" ")[1]

        Rails.logger.warn "Enqueuing NAMMEEE for #{gem_name}"

        # remove any quotes from the gem name
        gem_name = gem_name.gsub(/['"]/, '')

        # remove any commas from the gem name
        gem_name = gem_name.gsub(/[,]/, '')

        app_gem = AppGem.find_or_create_by(name: gem_name)
        self.app_gems << app_gem

        Rails.logger.warn "Enqueuing UpdateGemDataJob for #{app_gem.name} - #{app_gem.id}"

        UpdateGemDataJob.perform_async(app_gem.id)
      end
    end
  end
end
