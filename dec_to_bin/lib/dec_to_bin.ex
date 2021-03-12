defmodule DecToBin do

  def dec_to_bin(a, n) do
    pwr_of_2 = :math.pow(2, n) |> round
    if rem(a, pwr_of_2) do
      [1 | dec_to_bin(a - pwr_of_2, n + 1)]
    else
      [0 | dec_to_bin(a - pwr_of_2, n + 1)]
    end
  end

  def dec_to_bin(a) do
    dec_to_bin(a, 0)
  end

end
