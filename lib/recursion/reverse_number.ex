defmodule FunctionalElixir.Recursion.ReverseNumber do
  def reverse(num, acc \\ 0)
  def reverse(0, acc), do: acc
  def reverse(num, acc) do
    reverse(div(num, 10), acc * 10 + rem(num, 10))
  end
end

# reverse(123, 0) =
#   = reverse(12, 0 * 10 + 3)
#   = reverse(1, 3 * 10 + 2)
#   = reverse(1, )
