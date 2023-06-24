defmodule Tutorials.Recursion.PrintDigits do
  # base case
  def upto(0), do: :ok
  def upto(num) do
    IO.puts(num)
    upto(num - 1)
  end
end
