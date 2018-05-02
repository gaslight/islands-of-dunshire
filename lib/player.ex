defmodule Islands.Player do
  alias __MODULE__
  @type t :: name: String.t() | nil

  defstruct name: nil
end
