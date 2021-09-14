defmodule Transaction do
  @transactions "db/transaction.txt"

  @keys date: Date.utc_today(), type: nil, value: 0, of: nil, afor: nil

  defstruct @keys

  def save(type, of, value, date, afor \\ nil) do
    transactions =
      find_transactions() ++
        [%__MODULE__{type: type, of: of, value: value, date: date, afor: afor}]

    File.write(@transactions, :erlang.term_to_binary(transactions))
  end

  def find_all, do: find_transactions()
  def find_by_day(date), do: Enum.filter(find_all(), &(&1.date == date))

  def find_by_month(year, month),
    do: Enum.filter(find_all(), &(&1.date.year == year && &1.date.month == month))

  def find_by_year(year), do: Enum.filter(find_all(), &(&1.date.year == year))

  def find_transactions do
    {:ok, binary} = File.read(@transactions)

    binary
    |> :erlang.binary_to_term()
  end

  def calc(transactions) do
    Enum.reduce(transactions, 0, fn x, acc -> acc + x.value end)
  end

  def calc_all() do
    transactions = find_all()
    {transactions, calc(transactions)}
  end

  def calc_by_day(date) do
    transactions = find_by_day(date)
    {transactions, calc(transactions)}
  end

  def calc_by_month(year, month) do
    transactions = find_by_month(year, month)
    {transactions, calc(transactions)}
  end

  def calc_by_year(year) do
    transactions = find_by_year(year)
    {transactions, calc(transactions)}
  end
end
