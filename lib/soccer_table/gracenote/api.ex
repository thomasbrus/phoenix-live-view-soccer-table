defmodule SoccerTable.Gracenote.API do
  @endpoint "https://sportapi.widgets.sports.gracenote.com/football"

  @headers [
    Accept: "application/json",
    Origin: "https://widgets.sports.gracenote.com",
    Referer: "https://widgets.sports.gracenote.com/v1.9/index.html",
    "User-Agent": "SoccerTable (Phoennix LiveView Demo)"
  ]

  @options [ssl: [{:versions, [:"tlsv1.2"]}]]

  def get_table do
    get_json("/gettable/phaseid/132600/languagecode/1.json?c=115&module=football&type=standing")
  end

  defp get_json(path) do
    HTTPoison.get(@endpoint <> path, @headers, @options) |> decode_json_response()
  end

  defp decode_json_response({:ok, %HTTPoison.Response{body: body}}) do
    body |> :zlib.gunzip() |> String.trim_leading("\uFEFF") |> Jason.decode!()
  end
end
