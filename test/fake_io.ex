defmodule FakeIO do
  defdelegate puts(message), to: IO
  def gets("Enter your X coord: "), do: GuessAgent.get_x()
  def gets("Enter your Y coord: "), do: GuessAgent.get_y()
  def gets(value), do: raise ArgumentError, message: "invalid argument #{value}"
end
