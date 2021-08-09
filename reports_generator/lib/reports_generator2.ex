defmodule ReportsGeneratorPipe do
  # using pipe operaton and function for return
  def build(filename) do
    "reports/#{filename}"
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, file_content}), do: file_content
  defp handle_file({:error, _reason}), do: "Error while openign file!"
end
