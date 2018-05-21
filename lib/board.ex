defmodule Islands.Board do
  alias __MODULE__
  alias Islands.Player
  @type coordinates :: {number, number}
  @type  t :: %Board{
    player: Player.t(),
    islands: list(coordinates),
    hits: list(coordinates)
  }

  defstruct player: %Player{},
            islands: [],
            hits: []
end
