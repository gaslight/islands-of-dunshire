defmodule GameTest do
  use ExUnit.Case
  alias Islands.{Board, Game, Guess, Player}

  setup do
    {:ok, %{player1: %Player{name: "Player1"}, board: %Board{islands: [{0, 0}]}}}
  end

  describe "maybe_record_hit/2" do
    test "processes hits", %{board: board} do
      assert Game.maybe_record_hit(board, %Guess{coordinates: {0, 0}}) == %Board{islands: [{0, 0}], hits: [{0, 0}]}
    end

    test "processes misses", %{board: board} do
      assert Game.maybe_record_hit(board, %Guess{coordinates: {0, 1}}) == board
    end
  end

  describe "maybe_alert_winner/2" do
    test "processes winning game", %{player1: player1} do
      assert Game.maybe_alert_winner(%Board{islands: [{0, 0}], hits: [{0, 0}]}, player1) == "Player1 is the winner!"
    end

    test "processes non winning game", %{player1: player1} do
      assert Game.maybe_alert_winner(%Board{islands: [{0, 0}], hits: []}, player1) == nil
      assert Game.maybe_alert_winner(%Board{islands: [{0, 0}, {0, 1}], hits: [{0, 0}]}, player1) == nil
    end
  end

  describe "player_turn/3" do
    test "player takes a turn and wins", %{player1: player1, board: board} do
      assert Game.player_turn(player1, %Guess{coordinates: {0, 0}}, board) == "Player1 is the winner!"
    end

    test "player takes a turn and does not win", %{player1: player1, board: board} do
      assert Game.player_turn(player1, %Guess{coordinates: {0, 1}}, board) == nil
    end
  end
end
