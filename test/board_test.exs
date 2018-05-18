defmodule Islands.BoardTest do
  use ExUnit.Case
  alias Islands.{Board, Island}
  @default_island %Island{coordinates: MapSet.new([{0, 0}])}
  @multi_coordinate %Island{coordinates: MapSet.new([{0, 0}, {0, 1}])}

  @default_board %Board{islands: MapSet.new([@default_island])}
  @multi_island %Board{islands: MapSet.new([@multi_coordinate])}

  describe "is_game_over?/1" do
    test "returns false unless all islands have been forested" do
      refute Board.is_game_over?(@default_board)
    end

    test "returns true if all islands have been forested" do
      board = %Board{
        islands:
          MapSet.new([%Island{coordinates: MapSet.new([{0, 0}]), hits: MapSet.new([{0, 0}])}])
      }

      assert Board.is_game_over?(board)
    end
  end

  describe "guess/2" do
    test "if a guess is a hit, add coordinates to that islands hits" do
      island = %Island{coordinates: MapSet.new([{0, 0}])}

      assert %Island{island | hits: MapSet.new([{0, 0}])} in Board.guess(@default_board, {0, 0}).islands
    end

    test "if a guess is not a hit, return the original board" do
      assert Board.guess(@default_board, {1, 0}) == @default_board
    end
  end

  describe "play/2" do
    test "returns {:game_over, new_board} if all islands are forested" do
      forested_island = %Island{@default_island | hits: MapSet.new([{0, 0}])}

      assert Board.play(@default_board, {0, 0}) ==
               {:game_over, %Board{@default_board | islands: MapSet.new([forested_island])}}
    end

    test "returns a non-updated board if the coordinate passed in is a miss" do
      assert Board.play(@default_board, {1, 1}) == {"Dunshire lives on!!!!", @default_board}
    end

    test "returns an updated board if the coordinate pass in is a hit" do
      expected_island = %Island{@multi_coordinate | hits: MapSet.new([{0, 0}])}

      assert Board.play(@multi_island, {0, 0}) ==
               {"Dunshire lives on!!!!",
                %Board{@multi_island | islands: MapSet.new([expected_island])}}
    end
  end
end
