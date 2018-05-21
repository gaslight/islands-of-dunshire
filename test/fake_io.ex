defmodule FakeIO do
  defdelegate puts(message), to: IO
  def gets("Enter your X coord: "), do: "0"
  def gets("Enter your Y coord: "), do: "0"
  def gets(value), do: raise ArgumentError, message: "invalid argument #{value}"
end
