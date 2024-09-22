describe PgHeroAssets, '.prepare_assets' do
  it 'prepares all required assets' do
    root = PgHeroAssets.asset_root
    FileUtils.rm_rf(root) if root.exist?

    PgHeroAssets.prepare_assets

    expect(root).to exist
    expect(root.join('stylesheets/pghero/application.css')).to exist
    expect(root.join('javascripts/pghero/application.js')).to exist
    expect(root.join('images/pghero/favicon.png')).to exist
  end
end
