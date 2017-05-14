defmodule Battleship.GameControllerTest do
  use Battleship.ConnCase

  test "should create new game", %{conn: conn} do
    conn = post conn, game_path(conn, :create), [ username: "some_username" ]
    assert redirected_to(conn) =~ ~r|/games/[^/]*|
  end

  test "should redirect to valid show-function", %{conn: conn} do
    conn = post conn, game_path(conn, :create), [ username: "some_username" ]
    "/games/" <> id = redirected_to(conn)
    assert redirected_to(conn) == game_path(conn, :show, URI.decode(id))
  end

  test "New game should know user's name", %{conn: conn} do
    expected_username = "some_327192_username"
    conn = post conn, game_path(conn, :create), [ username: expected_username ]
    conn = get conn, redirected_to(conn)
    assert html_response(conn, 200) =~ expected_username
  end
end
