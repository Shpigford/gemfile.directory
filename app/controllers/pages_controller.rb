class PagesController < ApplicationController
  def top_gems
    # Top gems are the gems that exist the most number of times in GemfileAppGem
    @gems = GemfileAppGem.joins(:app_gem)
                         .group("app_gems.name, app_gems.details")
                         .select("app_gems.name, COUNT(gemfile_app_gems.app_gem_id) as count, app_gems.details")
                         .order("count DESC")
                         .limit(25)
  end
end
