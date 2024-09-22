require 'rails/railtie'
require 'rails/engine/railties'

module PgHeroAssets
  class Railtie < ::Rails::Railtie
    initializer 'pghero_assets.initializer' do |app|
      PgHeroAssets.disable_pghero_api_check
      app.middleware.insert(0, PgHeroAssets::Middleware)
    end
  end
end
