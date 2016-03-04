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

