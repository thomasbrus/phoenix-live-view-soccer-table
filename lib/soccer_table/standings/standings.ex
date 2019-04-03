defmodule SoccerTable.Standings do
  alias SoccerTable.Gracenote
  defdelegate list(), to: Gracenote, as: :get_standings
end
