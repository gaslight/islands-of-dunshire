defmodule Islands.Guess do
  alias __MODULE__
  alias Islands.Player
  type t :: player: Player.t(),
            coordinates: Board.coordinate

  defstruct player: %Player{},
            coordinates: {nil, nil}
end
