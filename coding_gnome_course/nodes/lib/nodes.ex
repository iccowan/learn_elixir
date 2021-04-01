defmodule Nodes do

  alias Nodes.{ Chain, Demo }

  defdelegate reverse(), to: Demo

  def chain(next_node), do: Chain.start_link(next_node)

end
