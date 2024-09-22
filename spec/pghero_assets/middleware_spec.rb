describe PgHeroAssets::Middleware do
  it 'serves assets' do
    env = { Rack::PATH_INFO => "/images/pghero/favicon.png" }
    app = ->* { [ 404, {}, 'nada'] }

    res = described_class.new(app).call(env)
    expect(res[0..1]).to match [200, hash_including('content-type' => 'image/png')]
    expect(res[2].join.force_encoding('ASCII-8BIT')).to match(/\A\x89PNG./n)
  end

  it 'logs a warning when an asset is not found' do
    env = { Rack::PATH_INFO => "/images/pghero/foo.png" }
    app = ->* { [ 404, {}, 'nada'] }

    expect(Rails.logger).to receive(:warn)
    expect(described_class.new(app).call(env)).to eq [404, {}, 'nada']
  end
end
