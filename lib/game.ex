defmodule Islands.Game do
  alias Islands.{Board, Player}

  @io Application.get_env(:islands_of_dunshire, :fake_io) || IO

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

  def play_game(board1 = %Board{}, board2 = %Board{}), do: play_game(board1, board2, 1, nil)
  def play_game(board1 = %Board{}, board2 = %Board{}, turn_count, nil) do
    coordinates = get_guess_coords()
    case Integer.mod(turn_count, 1) do
      0 -> play_game(board2, board1, turn_count + 1, player_turn(coordinates, board1))
      _ -> play_game(board1, board2, turn_count + 1, player_turn(coordinates, board1))
    end
  end
  def play_game(%Board{}, %Board{}, _turn_count, message), do: message

  def get_guess_coords() do
    x_coord = "Enter your X coord: " |> @io.gets |> String.trim
    y_coord = "Enter your Y coord: " |> @io.gets |> String.trim
    {String.to_integer(x_coord), String.to_integer(y_coord)}
  end
end
