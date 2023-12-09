class UpdateGemDataJob
  include Sidekiq::Job

  def perform(app_gem_id)
    app_gem = AppGem.find_by(id: app_gem_id)

    if app_gem.present?
      begin
        gem_data = Gems.info(app_gem.name)
      rescue Gems::NotFound => e
        return
      end

      app_gem.update(
        details: gem_data
      )
    end
  end
end
