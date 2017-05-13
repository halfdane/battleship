defmodule Battleship.HelloController do
  use Battleship.Web, :controller

  def index(conn, _params) do
    render conn, "hello.html"
  end
end
