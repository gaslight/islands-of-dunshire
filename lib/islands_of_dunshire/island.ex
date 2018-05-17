defmodule Islands.Island do
  alias __MODULE__

  @type t :: %Island{
          coordinates: MapSet.t(Board.coordinates()),
          hits: MapSet.t(Board.coordinates())
        }

  defstruct coordinates: MapSet.new(),
            hits: MapSet.new()

  def is_forested?(%Island{} = island) do
    MapSet.equal?(island.coordinates, island.hits)
  end
end
