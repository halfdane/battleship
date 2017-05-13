defmodule Battleship.GameController do
  use Battleship.Web, :controller

  def random_string(length) do
    :crypto.strong_rand_bytes(length) |> Base.url_encode64 |> binary_part(0, length)
  end

  def show(conn, %{"id" => game_id}) do
    render conn, "game.html", game_id: game_id
  end

  def create(conn, %{"username" => messenger}) do
    render conn, "game.html", messenger: messenger, game_id: random_string(10)
  end

end
