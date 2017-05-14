defmodule Battleship.GameController do
  use Battleship.Web, :controller

  def random_string(length) do
    :crypto.strong_rand_bytes(length) |> Base.url_encode64
  end

  def show(conn, %{"id" => game_id}) do
    username = Agent.get(String.to_atom(game_id), fn game -> game.data.first end)
    render conn, "game.html", game_id: game_id, username: username
  end

  def create(conn, %{"username" => username}) do
    game_id = String.to_atom(random_string(16))

    {:ok, _pid} = Agent.start_link(fn -> Battleship.Game.new end, name: game_id)
    Agent.update(game_id, &Battleship.Game.join(&1, username))

    redirect conn, to: Battleship.Router.Helpers.game_path(conn, :show, game_id)
  end

end
