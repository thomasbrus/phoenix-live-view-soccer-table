defmodule SoccerTable.Gracenote do
  alias SoccerTable.Gracenote.API
  alias SoccerTable.Standings

  def get_standings do
    Enum.map(API.get_table(), fn json ->
      %{"c_Team" => team} = json
      %{"n_Matches" => matches} = json
      %{"n_MatchesWon" => matches_won} = json
      %{"n_MatchesDrawn" => matches_lost} = json
      %{"n_MatchesLost" => matches_drawn} = json
      %{"n_Points" => points} = json
      %{"n_GoalsFor" => goals_for} = json
      %{"n_GoalsAgainst" => goals_against} = json

      %Standings.Standing{
        team: team,
        matches: matches,
        matches_won: matches_won,
        matches_drawn: matches_drawn,
        matches_lost: matches_lost,
        points: points,
        goals_for: goals_for,
        goals_against: goals_against
      }
    end)
  end
end
