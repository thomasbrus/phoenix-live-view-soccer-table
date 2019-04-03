defmodule SoccerTableWeb.StandingsLive do
  use Phoenix.LiveView

  def render(assigns) do
    SoccerTableWeb.PageView.render("standings.html", assigns)
  end

  def mount(_session, socket) do
    {:ok, assign(socket, standings: SoccerTable.Standings.list(), sort_by: "rank", sort_direction: "asc")}
  end

  def handle_event("refresh", _value, socket) do
    {:noreply, assign(socket, standings: SoccerTable.Standings.list())}
  end

  def handle_event("sort-by", sort_by, socket) do
    sort_direction = toggle_sort_direction(socket, sort_by)

    socket =
      socket
      |> assign(:sort_by, sort_by)
      |> assign(:sort_direction, sort_direction)
      |> assign(:standings, sort_standings(SoccerTable.Standings.list(), sort_by, sort_direction))

    {:noreply, socket}
  end

  defp toggle_sort_direction(%{assigns: %{sort_by: sort_by, sort_direction: "asc"}}, sort_by) do
    "desc"
  end

  defp toggle_sort_direction(%{assigns: %{sort_by: sort_by, sort_directionn: "desc"}}, sort_by) do
    "asc"
  end

  defp toggle_sort_direction(_socket, _sort_by) do
    "asc"
  end

  defp sort_standings(standings, "rank", "asc") do
    standings |> Enum.sort_by(& String.to_integer(&1.rank))
  end

  defp sort_standings(standings, "team", "asc") do
    standings |> Enum.sort_by(& &1.team_name)
  end


  defp sort_standings(standings, "matches", "asc") do
    standings |> Enum.sort_by(& &1.matches)
  end

  defp sort_standings(standings, "won", "asc") do
    standings |> Enum.sort_by(& &1.matches_won)
  end

  defp sort_standings(standings, "drawn", "asc") do
    standings |> Enum.sort_by(& &1.matches_drawn)
  end

  defp sort_standings(standings, "lost", "asc") do
    standings |> Enum.sort_by(& &1.matches_lost)
  end

  defp sort_standings(standings, "points", "asc") do
    standings |> Enum.sort_by(& &1.points)
  end

  defp sort_standings(standings, "goal_difference", "asc") do
    standings |> Enum.sort_by(&(&1.goals_for - &1.goals_against))
  end

  defp sort_standings(standings, sort_by, "desc") do
    standings |> sort_standings(sort_by, "asc") |> Enum.reverse()
  end
end
