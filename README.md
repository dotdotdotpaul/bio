# Bio

Bio is an Elixir package for developing bioinformatics software.  It is greatly
inspired by, if not based on, the bio-ruby gem (see http://bioruby.org/)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add bio to your list of dependencies in `mix.exs`:

        def deps do
          [{:bio, "~> 0.0.1"}]
        end

  2. Ensure bio is started before your application:

        def application do
          [applications: [:bio]]
        end

## Testing

The Gemfile(.lock) files and Guardfile at the root are there simply for
testing.  If you have the ruby gem Bundler installed, you can run:

  bundle install
  bundle exec guard

This will monitor the lib and test directories and rerun the appropriate tests
when the source files change.


