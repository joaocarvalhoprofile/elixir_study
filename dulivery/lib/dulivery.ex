defmodule Dulivery do
  alias Dulivery.Users.Create, as: UserCreate

  # Users
  defdelegate create_user(params), to: UserCreate, as: :call
end
