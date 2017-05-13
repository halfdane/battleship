defmodule Battleship.HelloController do
  use Battleship.Web, :controller

  def index(conn, _params) do
    render conn, "hello.html"
  end

  def show(conn, %{"messenger" => messenger}) do
    render conn, "show.html", messenger: messenger
  end

end
