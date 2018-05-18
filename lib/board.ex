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

  def play(board, coordinate) do
    board = guess(board, coordinate)

    with true <- board |> is_game_over?() do
      {:game_over, board}
    else
      _ ->
        {"Dunshire lives on!!!!", board}
    end
  end

  def is_game_over?(%Board{} = board) do
    Enum.all?(board.islands, fn island -> Island.is_forested?(island) end)
  end

  def guess(board, coordinate) do
    Enum.reduce(board.islands, board, fn island, acc ->
      case coordinate in island.coordinates do
        true ->
          %Board{acc | islands: update_islands(acc.islands, island, coordinate)}

        false ->
          acc
      end
    end)
  end

  defp update_islands(islands, island, coordinate) do
    MapSet.delete(islands, island)
    |> MapSet.put(Island.add_hit(island, coordinate))
  end
end
