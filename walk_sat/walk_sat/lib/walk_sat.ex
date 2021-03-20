defmodule WalkSat do

  alias WalkSat.IsSat

  defdelegate is_sat(dimacs_file_name), to: IsSat

end
