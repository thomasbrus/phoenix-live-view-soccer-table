defmodule SoccerTable.Standings.Standing do
  defstruct [
    :rank,
    :team_id,
    :team_name,
    :matches,
    :matches_won,
    :matches_drawn,
    :matches_lost,
    :points,
    :goals_for,
    :goals_against
  ]
end
