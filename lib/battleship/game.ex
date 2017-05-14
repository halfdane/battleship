defmodule Battleship.Game do
  use Fsm, initial_state: :greeting_first, initial_data: %{}

  defstate greeting_first do
      defevent join(user), data: game_state do
        new_game_state = Map.put(game_state, :first, user)
        next_state(:greeting_second, new_game_state)
      end
  end

  defstate greeting_second do
      defevent join(user), data: game_state do
        new_game_state = Map.put(game_state, :second, user)
        next_state(:ship_placement, new_game_state)
      end
  end

  defstate ship_placement do

  end

end