defmodule Dulivery.Exception.Error do
  @keys [:status, :result]

  @enforce_keys @keys

  defstruct @keys

  def build(status, result) do
    %__MODULE__{
      status: status,
      result: result
    }
  end

  def build_not_found_error(schema), do: build(:not_found, schema <> " not found")
end
