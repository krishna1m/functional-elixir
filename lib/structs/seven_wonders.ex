defmodule FunctionalElixir.Structs.SevenWonders do
  alias FunctionalElixir.Structs.SevenWonders
  defstruct name: "", country: "" 
  @type t :: %SevenWonders{
    name: String.t(),
    country: String.t()
  }

  @spec all :: [t()]
  def all() do
    [
      %SevenWonders{name: "Taj Mahal", country: "India"},
      %SevenWonders{name: "Chichen Itza", country: "Mexico"},
      %SevenWonders{name: "Petra", country: "Jordan"},
      %SevenWonders{name: "Machu Picchu", country: "Peru"},
      %SevenWonders{name: "Christ the Redeemer", country: "Brazil"},
      %SevenWonders{name: "Colosseum", country: "Italy"},
      %SevenWonders{name: "The Great Wall of China", country: "China"}
    ]
  end

  # for comprehension
  @spec get_wonder_names([t()]) :: [String.t()]
  def get_wonder_names(wonders) do
    for %{name: name} <- wonders, do: name
  end

  @spec print_names([t()]) :: :ok
  def print_names(wonders) do
    wonders
    |> Enum.each(fn %{name: wonder_name} -> IO.puts(wonder_name) end)
  end

  @spec filter_by_country([t()], String.t()) :: [t()]
  def filter_by_country(wonders, country) do
    wonders
    |> Enum.filter(fn %{country: country_name} -> country_name == country end)
  end

  @spec country_starting_with([t()], String.t()) :: [t()]
  def country_starting_with(wonders, bitString) do
    wonders
    |> Enum.filter(fn %{country: country_name} -> String.starts_with?(country_name, bitString) end)
  end

  @spec sort_by_country_length([t()]) :: [t()]
  def sort_by_country_length(wonders) do
    wonders
    |> Enum.sort(
      fn a, b -> String.length(a.country) < String.length(b.country) end
       )
  end

  # @spec name_country_list([t()]) :: [[String.t(), String.t()]]
  def name_country_list(wonders) do
    wonders
    |> Enum.map( fn wonder -> [wonder.name, wonder.country] end )
  end

  # @spec country_name_keyword_list([t()]) :: [:atom, String.t()]
  def country_name_keyword_list(wonders) do
    wonders
    |> Enum.map(&({String.to_atom(&1.name), &1.country}))
  end

end
