defmodule Transaction do
  @transactions "db/transaction.txt"

  @keys date: Date.utc_today(), type: nil, value: 0, of: nil, afor: nil

  defstruct @keys

  def save(type, of, value, date, afor \\ nil) do
    {:ok, binary} = File.read(@transactions)

    transactions =
      binary
      |> :erlang.binary_to_term()

    transactions =
      transactions ++
        [%__MODULE__{type: type, of: of, value: value, date: date, afor: afor}]

    File.write(@transactions, :erlang.term_to_binary(transactions))
  end

  def find_transactions do
    {:ok, binary} = File.read(@transactions)

    binary
    |> :erlang.binary_to_term()
  end
end
