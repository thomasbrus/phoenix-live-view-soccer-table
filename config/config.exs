# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :soccer_table,
  ecto_repos: [SoccerTable.Repo]

# Configures the endpoint
config :soccer_table, SoccerTableWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pjF+wdN3OgKqPeVlg7AbHzw+aEgJkcq9/V592WJreLu8XPDRoKHecMgCBFjJZ0YR",
  render_errors: [view: SoccerTableWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SoccerTable.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
