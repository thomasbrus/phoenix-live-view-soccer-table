defmodule SoccerTable.Standings.Standing do
  defstruct [
    :team,
    :matches,
    :matches_won,
    :matches_drawn,
    :matches_lost,
    :points,
    :goals_for,
    :goals_against
  ]
end
