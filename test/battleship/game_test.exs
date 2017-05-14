defmodule GameTest do
  use ExUnit.Case

  test "initial state is greeting first user" do
    assert Battleship.Game.new.state == :greeting_first
  end

  test "when greeting, first user can join" do
    game = Battleship.Game.new |> Battleship.Game.join("first_user")
    assert game.state == :greeting_second
    assert game.data.first == "first_user"
  end

  test "second user can join after first one" do
    game = Battleship.Game.new
        |> Battleship.Game.join("first_user")
        |> Battleship.Game.join("second_user")
    assert game.state == :ship_placement
    assert game.data.first == "first_user"
    assert game.data.second == "second_user"
  end

end