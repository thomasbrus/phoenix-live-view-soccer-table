defmodule SoccerTable.Repo do
  use Ecto.Repo,
    otp_app: :soccer_table,
    adapter: Ecto.Adapters.Postgres
end
