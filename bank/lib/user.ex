defmodule User do
  @keys [name: nil, email: nil]

  # @enforce_keys @keys

  defstruct @keys

  def new(name, email) do
    %__MODULE__{name: name, email: email}
  end
end
