defmodule Islands.Board do
  @type coordinate :: {number, number},
  @type  t :: size: coordinate,
              islands: list(coordinate),
              hits: list(Guess.t())

  defstruct size: {nil, nil},
            islands: [],
            hits: []
end
