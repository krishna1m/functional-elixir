defmodule FunctionalElixir.Lists do
  @moduledoc """
  Function summary:
  1. sum  
  2. reverse
  """
  @doc """
  Returns the sum of numbers in a list.
  """
  @spec sum([any()], integer()) :: number()
  def sum(list, acc \\ 0)
  def sum([], acc), do: acc
  def sum([hd | tl], acc), do: sum(tl, acc + hd)

  @doc """
  Returns a list with the elements reversed.
  """
  @spec reverse([any()], [any()]) :: [any()]
  def reverse(list, acc \\ [])
  def reverse([], acc), do: acc
  def reverse([h | t], acc), do: reverse(t, [h | acc])


  @doc """
  Returns a list with the elements mapped using an anonymous function.
  """
  @spec map([any()], (any() -> any()), [any()]) :: [any()]
  def map(elements, func, acc \\ []) 
  def map([], _, acc), do: acc |> reverse
  def map([h | t], func, acc), do: map(t, func, [ func.(h) | acc ])


  @doc """
  Returns a list with the two inputs lists concatenated.
  """
  @spec concat([any()], [any()]) :: [any()]
  def concat(la, lb), do: concat_func(reverse(la), lb)
  defp concat_func([], list), do: list
  defp concat_func([h | t], list), do: concat_func(t, [h | list])



  @doc """
  Returns a flatmapped list.
  """
  @spec flat_map([any()], (any() -> [any()]), [any()]) :: [any()]
  def flat_map(list, func, acc \\ [])
  def flat_map([], _, acc), do: acc
  def flat_map([h | t], func, acc), do: flat_map(t, func, concat(acc, func.(h)))
end


