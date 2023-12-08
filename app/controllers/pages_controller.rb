class PagesController < ApplicationController

  def home
  end

  def top_gems
    # Top gems are the gems that exist the most number of times in GemfileAppGem
    @gems = GemfileAppGem.joins(:app_gem)
                         .group('app_gems.name')
                         .select('app_gems.name, COUNT(gemfile_app_gems.app_gem_id) as count')
                         .order('count DESC')
                         .limit(10)
  end

end
