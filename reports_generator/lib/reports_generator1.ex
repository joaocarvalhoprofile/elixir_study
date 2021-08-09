defmodule ReportsGenerator1 do
  # Using case
  def build(filename) do
    case File.read("reports/#{filename}") do
      {:ok, result} -> result
      {:error, reason} -> reason
    end
  end
end
