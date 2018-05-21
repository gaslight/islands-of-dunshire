defmodule GameTest do
  use ExUnit.Case
  alias Islands.{Board, Game, Player}

  setup do
    player1 = %Player{name: "Player1"}
    player2 = %Player{name: "Player2"}
    board1 = %Board{player: player1, islands: [{0, 0}]}
    board2 = %Board{player: player2, islands: [{0, 1}]}
    {:ok, %{board1: board1, board2: board2}}
  end

  describe "maybe_record_hit/2" do
    test "processes hits", %{board1: board1} do
      assert Game.maybe_record_hit(board1, {0, 0}) == %Board{board1 | hits: [{0, 0}]}
    end

    test "processes misses", %{board1: board1} do
      assert Game.maybe_record_hit(board1, {0, 1}) == board1
    end
  end

  describe "maybe_alert_winner/2" do
    test "processes winning game", %{board1: board1} do
      assert Game.maybe_alert_winner(%Board{board1 | hits: [{0, 0}]}) == "Player1 is the winner!"
    end

    test "processes non winning game", %{board1: board1} do
      assert Game.maybe_alert_winner(%Board{board1 | hits: []}) == nil
      updated_board = %Board{board1 | islands: [{0, 0}, {0, 1}]}
      assert Game.maybe_alert_winner(%Board{updated_board | hits: [{0, 0}]}) == nil
    end
  end

  describe "player_turn/3" do
    test "player takes a turn and wins", %{board1: board1} do
      assert Game.player_turn({0, 0}, board1) == "Player1 is the winner!"
    end

    test "player takes a turn and does not win", %{board1: board1} do
      assert Game.player_turn({0, 1}, board1) == nil
    end
  end

  describe "play game" do
    test "player1 wins game", %{board1: board1} do
      assert Game.play_game(board1, %Board{}, 1, "Player1 is the winner!") == "Player1 is the winner!"
    end

    test "player1 inputs a guess and wins game", %{board1: board1, board2: board2} do
      result = Game.play_game(board1, board2)
      assert result == "Player1 is the winner!"
    end
  end
end
