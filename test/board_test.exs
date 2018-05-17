defmodule Islands.BoardTest do
  use ExUnit.Case
  alias Islands.{Board, Island}

  describe "is_game_over?/1" do
    test "returns false unless all islands have been forested" do
      board = %Board{
        islands: MapSet.new([%Island{coordinates: MapSet.new([{0, 0}]), hits: MapSet.new([])}])
      }

      refute Board.is_game_over?(board)
    end

    test "returns true if all islands have been forested" do
      board = %Board{
        islands:
          MapSet.new([%Island{coordinates: MapSet.new([{0, 0}]), hits: MapSet.new([{0, 0}])}])
      }

      assert Board.is_game_over?(board)
    end
  end
end
