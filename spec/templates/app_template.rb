# template for dummy rails app used in specs

gem 'pghero_assets', path: __dir__ + '/../../'
gem 'pghero', '>= 3.6.0'

rake 'db:migrate db:test:prepare'
