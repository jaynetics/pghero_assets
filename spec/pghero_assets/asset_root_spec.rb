describe PgHeroAssets, '.asset_root' do
  it 'includes version numbers to bust browser caches on update' do
    stub_const('PgHero::VERSION', 'v1')
    stub_const('PgHeroAssets::VERSION', 'v2')
    expect(PgHeroAssets.asset_root).to eq Rails.root.join('tmp/pghero_assets/v1/v2')
  end
end
