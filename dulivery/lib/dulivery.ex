defmodule Dulivery do
  alias Dulivery.Users.Create, as: UserCreate
  alias Dulivery.Users.Get, as: UserGet

  # Users
  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate get_user_by_id(uuid), to: UserGet, as: :by_id
end
