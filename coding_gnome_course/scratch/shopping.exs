defmodule Shopping do

  def list() do
    [
      { "1 dozen", "eggs" },
      { "1 ripe", "melon" },
      { "4", "apples" },
      { "2 boxes", "tea" },
    ]
  end

  def increase_str_len(s, len, i) when i < len do
    " " <> s
    |> increase_str_len(len, i + 1)
  end

  def increase_str_len(s, _len, _i),
    do: s

  def increase_str_len(s, len) do
    old_len = String.length(s)
    increase_str_len(s, len - old_len, 0)
  end

  def print_list() do
    template = "quantity | item\n-----------------\n<%= for item <- Shopping.list() do %><%= elem(item, 0) |> Shopping.increase_str_len(8) %> | <%= elem(item, 1) %>\n<% end %>"

    IO.puts EEx.eval_string template
  end

  def plural_of(item, 1),
    do: "1 " <> item
  def plural_of(item, num) when num < 0,
    do: "<span style='color: red'>-#{ plural_of(item, num * -1) }</span>"
  def plural_of(item, num),
    do: Integer.to_string(num) <> " " <> item <> "s"

end
