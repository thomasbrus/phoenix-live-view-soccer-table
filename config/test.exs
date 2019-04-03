use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :soccer_table, SoccerTableWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :soccer_table, SoccerTable.Repo,
  database: "soccer_table_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
