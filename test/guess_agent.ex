defmodule GuessAgent do
  use Agent

  def start_link do
    Agent.start_link(fn -> %{coords: %{}, turn: 1} end, name: __MODULE__)
  end

  def put_coords(coords) do
    Agent.update(__MODULE__, fn state -> Map.put(state, :coords, coords) end)
  end

  def get_coords() do
    turn = Agent.get_and_update(__MODULE__, fn state ->
      {state.turn, Map.put(state, :turn, state.turn + 1)}
    end)
    Agent.get(__MODULE__, fn state ->
      Map.get(state.coords, Integer.to_string(turn))
    end)
  end

  def reset(), do: Agent.update(__MODULE__, fn state -> %{coords: %{}, turn: 1} end)
end
