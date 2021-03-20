defmodule WalkSatInterfaceWeb.WalkSatInterface do

  def process_input(num_symbols, clauses) do
    num_clauses = length(clauses)

    time_now = DateTime.utc_now()
    |> DateTime.to_unix()

    file_name = File.cwd!() <> "walk_sat_interface/assets/temp/temp-file-"
      <> Integer.to_string(time_now) <> ".cnf"
    { :ok, file } = File.open(file_name, [ :write ])

    file
    |> IO.binwrite("p cnf " <> Integer.to_string(num_symbols) <>
         " " <> Integer.to_string(length(clauses)))
    |> write_clauses(clauses)

    WalkSat.is_sat(file_name)
  end

  defp write_clause(file, [ h | [] ]) do
    file
    |> IO.binwrite(Integer.to_string(h))
  end
  defp write_clause(file, [ h | t ]) do
    file
    |> IO.binwrite(Integer.to_string(h))
    |> write_clause(t)
  end
  defp write_clauses(file, [ h | [] ]) do
    file
    |> write_clause(h)
  end
  defp write_clauses(file, [ h | t ]) do
    file
    |> write_clause(h)
    |> write_clauses(t)
  end

end
