defmodule Dulivery do
  alias Dulivery.Users.Create, as: UserCreate
  alias Dulivery.Users.Delete, as: UserDelete
  alias Dulivery.Users.Get, as: UserGet
  alias Dulivery.Users.Update, as: UserUpdate

  alias Dulivery.Items.Create, as: ItemCreate

  # Users
  defdelegate get_user_by_id(uuid), to: UserGet, as: :by_id
  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate delete_user(uuid), to: UserDelete, as: :call
  defdelegate update_user(params), to: UserUpdate, as: :call

  # Items
  defdelegate create_item(params), to: ItemCreate, as: :call
end
