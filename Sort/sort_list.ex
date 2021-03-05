defmodule Sort do

    def merge_lists(l1, l2, l1_i, l2_i) do
        cond do
            l1_i >= Enum.count(l1) ->
                Enum.concat(l1, l2)
            l2_i >= Enum.count(l2) ->
                l1
            Enum.at(l2, l2_i) >= Enum.at(l1, l1_i) ->
                List.insert_at(l1, l1_i, Enum.at(l2, l2_i))
                merge_lists(l1, l2, l1_i + 1, l2_i + 1)
                l1
            Enum.at(l2, l2_i) < Enum.at(l1, l1_i) ->
                merge_lists(l1, l2, l1_i + 1, l2_i)
                l1
        end
    end

    def merge_lists(l1, l2) do
        merge_lists(l1, l2, 0, 0)
    end

    def merge_sort(l) do
        if Enum.count(l) == 1 do
            l
        else
            {l, r} = Enum.split(l, div(Enum.count(l), 2))
            IO.inspect l
            IO.inspect r
            merge_lists(merge_sort(l), merge_sort(r))
        end
    end

end
