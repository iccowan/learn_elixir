defmodule WalkSatInterfaceWeb.WalkSatInterfaceTest do

  use ExUnit.Case

  alias WalkSatInterfaceWeb.WalkSatInterface

  test "correct DIMACS file format" do
    num_symbols = 3
    clauses = [
      [1, 2, 3],
      [1],
      [2, -3]
    ]

    assert WalkSatInterface.process_input(num_symbols, clauses)
  end

end
