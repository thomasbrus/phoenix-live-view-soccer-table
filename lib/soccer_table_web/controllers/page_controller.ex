defmodule SoccerTableWeb.PageController do
  use SoccerTableWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
