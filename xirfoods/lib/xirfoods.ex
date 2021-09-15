defmodule Xirfoods do
  alias Xirfoods.Orders.Agent, as: OrderAgent
  alias Xirfoods.Orders.CreateOrUpdate, as: CreateOrUpdateOrders
  alias Xirfoods.Users.Agent, as: UserAgent
  alias Xirfoods.Users.CreateOrUpdate, as: CreateOrUpdateUser

  def start_agents do
    UserAgent.start_link(%{})
    OrderAgent.start_link(%{})
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdateUser, as: :call
  defdelegate create_or_update_order(params), to: CreateOrUpdateOrders, as: :call
end
