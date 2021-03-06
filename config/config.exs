# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :battleship,
  ecto_repos: [Battleship.Repo]

# Configures the endpoint
config :battleship, Battleship.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XHtiVl0Fe/9poKZ1pebWd41TzCLjWWIZFndhmDKd0wudQUhoMUfKTF9f9apBgfig",
  render_errors: [view: Battleship.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Battleship.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

if Mix.env == :dev do
  config :mix_test_watch,
    clear: true
end