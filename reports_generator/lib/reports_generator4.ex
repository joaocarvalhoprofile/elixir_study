defmodule ReportsGenerator4 do
  # using reduce, map.put
  # private function initial map
  def build(filename) do
    "reports/#{filename}"
    |> File.stream!()
    |> Enum.reduce(report_acc(), fn line, report ->
      [id, _food_name, price] = parse_line(line)
      Map.put(report, id, report[id] + price)
    end)
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(2, &String.to_integer/1)
  end

  # defp report_acc, do: Enum.into(1..30, %{}, &{Integer.to_string(&1), 0})
  defp report_acc() do
    Enum.into(1..30, %{}, fn x -> {Integer.to_string(x), 0} end)
  end
end
