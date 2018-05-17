defmodule Islands.Board do
  alias __MODULE__
  alias Islands.Island
  @type coordinate :: {number, number}
  @type size :: {number, number}
  @type t :: %Board{
          size: size,
          islands: MapSet.t(Island.t())
        }

  defstruct size: {0, 15},
            islands: MapSet.new()

  def is_game_over?(%Board{} = board) do
    Enum.all?(board.islands, fn island -> Island.is_forested?(island) end)
  end
end
