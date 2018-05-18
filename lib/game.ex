defmodule Islands.Game do
  alias Islands.{Board, Guess, Player}

  def player_turn(guess = %Guess{player: player = %Player{}}, board = %Board{}) do
    board
    |> maybe_record_hit(guess)
    |> maybe_alert_winner(player)
  end


  def maybe_record_hit(board = %Board{islands: islands, hits: hits}, %Guess{coordinates: coordinates}) do
    case coordinates in islands and not coordinates in hits do
      true -> Map.put(board, :hits, [coordinates | hits])
      false -> board
    end
  end

  def maybe_alert_winner(%Board{islands: islands, hits: hits}, %Player{name: name}) do
    case Enum.reject(islands, fn(coordinates) -> coordinates in hits end) do
      [] -> "#{name} is the winner!"
      _ -> nil
    end
  end
end
