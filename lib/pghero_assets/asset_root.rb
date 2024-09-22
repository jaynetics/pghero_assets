module PgHeroAssets
  def self.asset_root
    Rails.root.join("tmp/pghero_assets/#{PgHero::VERSION}/#{PgHeroAssets::VERSION}")
  end
end
