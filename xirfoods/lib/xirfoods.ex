defmodule Xirfoods do
  alias Xirfoods.Users.Agent, as: UserAgent
  alias Xirfoods.Users.CreateOrUpdate

  def start_agents do
    UserAgent.start_link(%{})
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdate, as: :call
end
