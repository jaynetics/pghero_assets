require 'rack/mime'

module PgHeroAssets
  # Catches pghero asset requests and serves them from the gem.
  class Middleware
    def initialize(app, *)
      @app = app
      @regexp = %r{\A/(?:javascripts|images|stylesheets)/pghero}
    end

    def call(env)
      @regexp.match?(env[Rack::PATH_INFO]) &&
        serve(env[Rack::PATH_INFO]) ||
        @app.call(env)
    end

    def serve(path)
      PgHeroAssets.prepare_assets
      send_data(path)
    rescue StandardError => e
      Rails.logger.warn("PgHeroAssets::Middleware: #{e.class} #{e.message}")
      nil
    end

    def send_data(path)
      prepared_asset_path = PgHeroAssets.asset_root.join(path.sub(%r{^/}, ''))
      data = File.read(prepared_asset_path)
      headers = {
        'cache-control'  => 'public, max-age=86400',
        'content-length' => data.bytesize.to_s,
        'content-type'   => Rack::Mime.mime_type(File.extname(path)),
      }
      [200, headers, [data]]
    end
  end
end
