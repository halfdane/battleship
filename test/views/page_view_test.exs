defmodule Battleship.PageViewTest do
  use Battleship.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders an input field for username" do
    html = render_to_string(Battleship.PageView, "index.html", [])
    assert html =~ ~r|<input name="username".*>|
   end

  test "renders a submit button" do
    html = render_to_string(Battleship.PageView, "index.html", [])
    assert html =~ ~r|<button id="new_game_starter">[^<]*</button>|
  end

  test "renders the form" do
    html = render_to_string(Battleship.PageView, "index.html", [])
    assert html =~ ~r|<form[^>]*action="/games"[^>]*method="post"[^>]*>|
  end

end
