defmodule Battleship.GameControllerTest do
  use Battleship.ConnCase

  test "can create new game", %{conn: conn} do
    conn = post conn, game_path(conn, :create), [ username: "some_username" ]
    assert redirected_to(conn) =~ ~r|/games/[^/]*|
  end

  test "Create a new game and then connect", %{conn: conn} do
    expected_username = "some_327192_username"
    conn = post conn, game_path(conn, :create), [ username: expected_username ]

    [location] = Plug.Conn.get_resp_header(conn, "location")
    "/games/" <> id = location

    assert location == game_path(conn, :show, URI.decode(id))

    conn = get conn, location
    assert html_response(conn, 200) =~ expected_username
  end
end
