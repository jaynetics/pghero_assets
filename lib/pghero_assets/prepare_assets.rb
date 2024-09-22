require 'fileutils'

# prepares assets for PgHero lazily / on demand
# based on discussion in https://github.com/ankane/pghero/pull/421
module PgHeroAssets
  PREPARE_ASSETS_MUTEX = Mutex.new

  def self.prepare_assets
    root_dir = PgHeroAssets.asset_root
    PREPARE_ASSETS_MUTEX.synchronize do
      root_dir.exist? ? return : FileUtils.mkdir_p(root_dir)
    end

    # Create application.js file for PgHero
    asset_src = PgHero::Engine.root.join('app/assets')
    js_file = root_dir.join('javascripts/pghero/application.js')
    js_file.dirname.mkpath
    files = Dir[asset_src.join('javascripts/**/*.js')].sort_by { _1.index(/application\.\w+\z/) || 0 }
    File.open(js_file, 'w') { |main| files.each { |f| main << File.read(f) << "\n\n" } }

    # Create application.css file for PgHero
    css_file = root_dir.join('stylesheets/pghero/application.css')
    css_file.dirname.mkpath
    files = Dir[asset_src.join('stylesheets/**/*.css')].sort_by { _1.index(/application\.\w+\z/) || 0 }
    File.open(css_file, 'w') { |main| files.each { |f| main << File.read(f) << "\n\n" } }

    # Symlink to PgHero's images
    FileUtils.ln_sf asset_src.join('images'), root_dir.join('images')
  end
end
