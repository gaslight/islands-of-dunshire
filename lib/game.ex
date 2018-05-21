defmodule Islands.Game do
  alias Islands.{Board, Player}

  def player_turn(coordinates, board = %Board{}) do
    board
    |> maybe_record_hit(coordinates)
    |> maybe_alert_winner
  end


  def maybe_record_hit(board = %Board{islands: islands, hits: hits}, coordinates) do
    case coordinates in islands and not coordinates in hits do
      true -> Map.put(board, :hits, [coordinates | hits])
      false -> board
    end
  end

  def maybe_alert_winner(%Board{islands: islands, hits: hits, player: %Player{name: name}}) do
    case Enum.reject(islands, fn(coordinates) -> coordinates in hits end) do
      [] -> "#{name} is the winner!"
      _ -> nil
    end
  end
end
