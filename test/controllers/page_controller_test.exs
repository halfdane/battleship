defmodule Battleship.PageControllerTest do
  use Battleship.ConnCase

  test "Can connect to main", %{conn: conn} do
    response = get conn, "/"
    assert response.status == 200
  end

  test "Main title exists", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Battleship!"
  end
end
