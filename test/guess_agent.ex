defmodule GuessAgent do
  use Agent
  
  def start_link do
    Agent.start_link(fn -> {nil, nil} end, name: __MODULE__)
  end

  def put_coords(coords) do
    Agent.update(__MODULE__, fn state -> coords end)
  end

  def get_x(), do: Agent.get(__MODULE__, fn state -> elem(state, 0) end)
  def get_y(), do: Agent.get(__MODULE__, fn state -> elem(state, 1) end)
end
