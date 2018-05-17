defmodule Islands.IslandTest do
  use ExUnit.Case
  alias Islands.Island

  describe "is_forested?/1" do
    test "returns false unless all coordinates on the island have been hit" do
      island = %Island{coordinates: MapSet.new([{0, 0}, {0, 1}]), hits: MapSet.new([{0, 0}])}
      refute Island.is_forested?(island)
    end

    test "returns true if all coordinates on the island have been hit" do
      island = %Island{coordinates: MapSet.new([{0, 0}]), hits: MapSet.new([{0, 0}])}
      assert Island.is_forested?(island)
    end
  end
end
