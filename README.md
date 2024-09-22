[![Gem Version](https://badge.fury.io/rb/pghero_assets.svg)](http://badge.fury.io/rb/pghero_assets)
[![Build Status](https://github.com/jaynetics/pghero_assets/actions/workflows/main.yml/badge.svg)](https://github.com/jaynetics/pghero_assets/actions)

# PgHeroAssets

This gem is for you if you want to be able to run [PgHero](https://github.com/pghero/pghero) without the asset pipeline or in Rails' api mode.

It serves all required PgHero assets from a custom middleware and disables the api mode check.

## Caveats

- This might break with PgHero updates, though I don't consider it likely so its not version-locked yet.

## Installation / usage

Add `pghero_assets` to your Gemfile.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jaynetics/pghero_assets.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
