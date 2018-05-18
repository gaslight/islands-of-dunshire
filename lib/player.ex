defmodule Islands.Player do
  alias __MODULE__
  @type t :: %Player{
    name: String.t() | nil
  }

  defstruct name: nil
end
