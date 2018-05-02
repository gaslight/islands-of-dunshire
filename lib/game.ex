defmodule Islands.Game do
  alias __MODULE__
  alias Islands.Guess

  def hit_or_miss?(board, %Guess{coordinates: coordinates} = guess) do
    coordinates in board.islands
  end
end
