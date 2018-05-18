defmodule Islands.Board do
  alias __MODULE__
  @type coordinates :: {number, number}
  @type  t :: %Board{
    islands: list(coordinates),
    hits: list(coordinates)
  }

  defstruct islands: [],
            hits: []
end
