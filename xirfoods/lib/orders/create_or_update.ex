defmodule Xirfoods.Orders.CreateOrUpdate do
  alias Xirfoods.Orders.Order
  alias Xirfoods.Orders.Agent, as: OrderAgent
  alias Xirfoods.Users.Agent, as: UserAgent

  def call(%{user_cpf: user_cpf, items: items}) do
    with {:ok, user} <- UserAgent.get(user_cpf),
         {:ok, items} <- build_items(items),
         {:ok, order} <- Order.build(user, items) do
      OrderAgent.save(order)
    else
      error -> error
    end
  end

  defp build_items(items) do
    items
  end
end
