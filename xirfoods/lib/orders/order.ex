defmodule Xirfoods.Orders.Order do
  alias Xirfoods.Orders.Item
  alias Xirfoods.Users.User

  @keys [:user_cpf, :delivery_address, :items, :total_price]
  @enforce_keys @keys

  defstruct @keys

  def build(%User{cpf: cpf, address: address}, [%Item{} | _items] = items) do
    {:ok,
     %__MODULE__{
       user_cpf: cpf,
       delivery_address: address,
       items: items,
       total_price: calculate_total_order(items)
     }}
  end

  def build(_user, _items), do: {:error, "Invalid parameters"}

  defp calculate_total_order(items) do
    Enum.reduce(items, Decimal.new("0.00"), &sum_price(&1, &2))
  end

  defp sum_price(%Item{unity_price: price, quantity: quantity}, acumulator) do
    price
    |> Decimal.mult(quantity)
    |> Decimal.add(acumulator)
  end
end
