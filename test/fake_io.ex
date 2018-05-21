defmodule FakeIO do
  defdelegate puts(message), to: IO
  def gets("Enter your X,Y guess coords: "), do: GuessAgent.get_coords()
  def gets(value), do: raise ArgumentError, message: "invalid argument #{value}"
end
