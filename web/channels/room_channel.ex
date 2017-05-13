defmodule Battleship.RoomChannel do
  use Phoenix.Channel

  def join("room:lobby", message, socket) do
    IO.puts inspect message
    {:ok, socket}
  end
  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end
  def handle_in("new_msg", %{"body" => body}, socket) do
    IO.puts inspect body
    broadcast! socket, "new_msg", %{body: body}
    {:noreply, socket}
  end

  def handle_out("new_msg", payload, socket) do
    IO.puts inspect payload
    push socket, "new_msg", payload
    {:noreply, socket}
  end
end
