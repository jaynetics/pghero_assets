module PgHeroAssets
  def self.disable_pghero_api_check
    require 'pghero'
    require PgHero::Engine.root.join('app/helpers/pg_hero/home_helper')
    require PgHero::Engine.root.join('app/controllers/pg_hero/home_controller')
    PgHero::HomeController.define_method(:check_api) {}
  end
end
