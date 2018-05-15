defmodule Islands.Game do
  alias __MODULE__
  alias Islands.{Board, Guess}

  def hit_or_miss?(%Board{islands: islands}, %Guess{coordinates: coordinates} = guess) do
    coordinates in islands
  end

  def winner?(%Board{islands: islands, hits: hits}) do
    case Enum.reject(islands, fn(coordinates) -> coordinates in hits end) do
      [] -> true
      _ -> false
    end
  end
end
