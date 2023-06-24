defmodule FunctionalElixirTest do
  use ExUnit.Case
  doctest FunctionalElixir

  test "greets the world" do
    assert FunctionalElixir.hello() == :world
  end
end
