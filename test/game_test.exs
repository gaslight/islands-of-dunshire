defmodule GameTest do
  use ExUnit.Case

  test "placing the first island in the setup phase succeeds" do
    move = {:place_island, %{type: :atoll, x: 0, y: 0}}
    response = Game.play(%Game{}, move)
    assert {:ok, %Game{moves: [^move]}} = response
  end

  # test "placing a set of islands on the second turn fails" do
  #   response = Game.play(%Game{}, {:place_islands, []})
  #   assert response = :ok
  # end
end
