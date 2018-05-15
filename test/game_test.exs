defmodule GameTest do
  use ExUnit.Case
  alias Islands.{Guess, Game, Board}

  describe "hit_or_miss?/2" do
    test "processes hits" do
      assert Game.hit_or_miss?(%Board{islands: [{0, 0}]}, %Guess{coordinates: {0, 0}})
    end

    test "processes misses" do
      refute Game.hit_or_miss?(%Board{islands: [{0, 0}]}, %Guess{coordinates: {0, 1}})
    end
  end

  describe "winner?/1" do
    test "processes winning game" do
      assert Game.winner?(%Board{islands: [{0, 0}], hits: [{0, 0}]})
    end

    test "processes non winning game" do
      refute Game.winner?(%Board{islands: [{0, 0}], hits: []})
      refute Game.winner?(%Board{islands: [{0, 0}, {0, 1}], hits: [{0, 0}]})
    end
  end
end
