class UpdateGemDataJob
  include Sidekiq::Job

  def perform(app_gem_id)
    app_gem = AppGem.find_by(id: app_gem_id)

    if app_gem.present?
      gem_data = Gems.info(app_gem.name)

      app_gem.update(
        details: gem_data
      )
    end
  end
end
