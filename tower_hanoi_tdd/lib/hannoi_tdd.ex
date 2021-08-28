defmodule HannoiTdd do
  def call(discs) do
    recursion(discs, "A", "B", "C")
  end

  defp recursion(disc, origin, dest, aux) do
    if disc == 1 do
      [{origin, dest, disc}]
    else
      list = recursion(disc - 1, origin, aux, dest)
      list = list ++ [{origin, dest, disc}]
      list ++ recursion(disc - 1, aux, dest, origin)
    end
  end
end
