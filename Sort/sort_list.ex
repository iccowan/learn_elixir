defmodule Sort do

    def merge_lists(l1, l2) do
        cond do
            l1 == [] -> l2
            l2 == [] -> l1
            true ->
                [l1_val | new_l1] = l1
                [l2_val | new_l2] = l2

                if l1_val < l2_val do
                    [l1_val] ++ merge_lists(new_l1, l2)
                else
                    [l2_val] ++ merge_lists(l1, new_l2)
                end
            end
    end

    def merge_sort(l) do
        # Make sure the list is not of length 1
        unless length(l) <= 1 do
            # Split the lists in half
            {l1, l2} = Enum.split(l, div(length(l), 2))

            # The sorted list will be the merge of the two
            # split lists that have been sorted as well
            sorted = merge_lists(merge_sort(l1), merge_sort(l2))
        else
            # If the list is length 1, evaluate to the list
            l
        end
    end

end
