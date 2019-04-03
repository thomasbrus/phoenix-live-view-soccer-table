defmodule SoccerTableWeb.PageView do
  use SoccerTableWeb, :view

  def team_logo_url(team_id) do
    "//images.sports.gracenote.com/images/lib/basic/sport/football/club/logo/small/#{team_id}.png"
  end
end
