defmodule FunctionalElixir.Recursion.SumDigits do
  def sum(num, acc \\ 0)
  def sum(0, acc), do: IO.puts(acc)
  def sum(num, acc) do
    sum(num - 1, acc + num)
  end
end
