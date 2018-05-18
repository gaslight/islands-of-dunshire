defmodule Islands.Guess do
  alias __MODULE__
  alias Islands.Player
  @type t :: %Guess{
    player: Player.t(),
    coordinates: Board.coordinates
  }

  defstruct player: %Player{},
            coordinates: {nil, nil}
end
