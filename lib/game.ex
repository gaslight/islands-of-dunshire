defmodule Game do

  defstruct [:moves]

  def play(game = %Game{}, move = {:place_island, _}) do
    {:ok, %{game | moves: [move]}}
  end
end
