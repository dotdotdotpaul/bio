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

## Ensembl Database

This package is currently set up to expect to connect to a MySQL database
containing a copy of the Ensembl gene data (see http://www.ensembl.org).
Currently being tested with the GRCH37 version, the default config looks
for a database named `homo_sapiens_core_75_37`

Place this config in your `config/config.exs` file (or, if you're using
Phoenix, the config file for the appropriate environment).

    config :bio, Bio.Repo,
      adapter: Ecto.Adapters.MySQL,
      username: "",
      password: "",
      database: "homo_sapiens_core_75_37",
      hostname: "localhost",
      pool_size: 10

The tests are expecting to be able to connect to this database (and this
version in particular) to ensure that the schemas are working properly.

## Testing

The Gemfile(.lock) files and Guardfile at the root are there simply for
testing.  If you have the ruby gem Bundler installed, you can run:

    bundle install
    bundle exec guard

This will monitor the lib and test directories and rerun the appropriate tests
when the source files change.


