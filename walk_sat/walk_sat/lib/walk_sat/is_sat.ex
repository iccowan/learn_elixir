defmodule WalkSat.IsSat do

  @prob_random 50
  @max_iter 1000

  def is_sat(_combo = { symbols, _clauses }, _is_sat = true, _iter),
    do: { :SAT, symbols }

  def is_sat(_combo = { _symbols, _clauses }, _is_sat = false, iter)
    when iter >= @max_iter, do: :UNSAT

  def is_sat(combo = { _symbols, clauses }, _is_sat = false, iter) do
    symbols = flip_symbol(combo, Enum.random(0..100) < @prob_random)
    combo = { symbols, clauses }
    is_sat(combo, sat(combo), iter + 1)
  end

  def is_sat(combo = { _symbols, _clauses }) do
    is_sat(combo, sat(combo), 0)
  end

  def is_sat(dimacs_file_name) do
    process_dimacs_file(dimacs_file_name)
    |> is_sat()
  end

################################### HELPERS ####################################

  defp flip_symbol({ symbols, _clauses }, _random = true) do
    random_index = Enum.random(1..length(symbols)) - 1
    List.update_at(symbols, random_index, & &1 * -1)
  end
  defp flip_symbol({ symbols, clauses }, _random = false) do
    { _num_clauses_sat, sym_to_flip } = symbols
    |> Enum.map(fn sym ->
        test_symbols = sym_flip(symbols, sym)
        Enum.reduce(clauses, 0, fn _clause, acc ->
            if sat({ test_symbols, clauses }) do
              acc + 1
            else
              acc
            end
          end
        )
      end
    )
    |> Enum.zip(symbols)
    |> Enum.max(& elem(&1, 0) > elem(&2, 0))

    sym_flip(symbols, sym_to_flip)
  end

  defp sym_flip(symbols, sym) do
    index = Enum.find_index(symbols, & &1 == sym)
    List.update_at(symbols, index, & &1 * -1)
  end

  defp sat({ _symbols, [] }), do: true
  defp sat({ symbols, [ clause_check | clauses] }), do: clause_sat(
    { symbols, clause_check }) && sat({ symbols, clauses }
  )

  defp clause_sat({ symbols, [ l ] }), do: lit_sat({ symbols, l })
  defp clause_sat({ symbols, [ h | t ] }), do: lit_sat({ symbols, h }) ||
    clause_sat({ symbols, t })

  defp lit_sat({ symbols, l }), do: Enum.member?(symbols, l)

  defp process_dimacs_file(dimacs_file_name) do
    [ num_symbols | clauses ] = File.stream!(dimacs_file_name)
    |> Enum.map(&String.trim/1)
    |> Enum.map(fn val ->
        String.split(val, " ")
      end
    )
    |> Enum.map(&process_dimacs_line/1)
    |> Enum.filter(& &1 != "")

    { Enum.to_list(1..num_symbols), clauses }
  end

  defp process_dimacs_line(line), do: process_dimacs_line(line,
    match_last_elem_of_list(line, "0"))
  defp process_dimacs_line(line = ["p" | _ ], _0_at_end = false) do
    line
    |> Enum.fetch!(2)
    |> Integer.parse()
    |> elem(0)
  end
  defp process_dimacs_line(_line, _0_at_end = false), do: ""
  defp process_dimacs_line(line, _0_at_end = true) do
    line
    |> Enum.map(fn val ->
        Integer.parse(val)
        |> elem(0)
      end
    )
    |> Enum.drop(-1)
  end

  defp match_last_elem_of_list([], _elem), do: false
  defp match_last_elem_of_list([ elem ], elem), do: true
  defp match_last_elem_of_list([ _h | t], elem) do
    match_last_elem_of_list(t, elem)
  end

end
