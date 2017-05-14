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

  test "New game should know user's name (but not second)", %{conn: conn} do
    expected_first_username = "first_username"
    expected_second_username = "second_username"

    conn = post conn, game_path(conn, :create), [ username: expected_first_username ]
    conn = get conn, redirected_to(conn)

    assert html_response(conn, 200) =~ expected_first_username
    assert ! (html_response(conn, 200) =~ expected_second_username)
  end

  test "Both users can join", %{conn: conn} do
    expected_first_username = "first_username"
    expected_second_username = "second_username"

    conn = post conn, game_path(conn, :create), [ username: expected_first_username ]
    conn = post conn, redirected_to(conn), [ username: expected_second_username ]
    conn = get conn, redirected_to(conn)

    assert html_response(conn, 200) =~ expected_first_username
    assert html_response(conn, 200) =~ expected_second_username
  end
end
