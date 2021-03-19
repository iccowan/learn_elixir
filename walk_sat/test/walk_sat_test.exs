defmodule WalkSatTest do
  use ExUnit.Case
  doctest WalkSat

  test "sat solver returns correctly" do
    { :ok, test_files } = File.ls("test_dimacs_files")

    Enum.map(test_files, fn file_path ->
        sat = Enum.fetch!(String.codepoints(file_path), 0)
        file_path = "test_dimacs_files/" <> file_path

        assert test_sat(sat, WalkSat.is_sat(file_path))
      end
    )
  end

  def test_sat("u", { :SAT, _sol }), do: false
  def test_sat("u", :UNSAT), do: true
  def test_sat(_, { :SAT, _sol }), do: true
  def test_sat(_, :UNSAT), do: false

end
