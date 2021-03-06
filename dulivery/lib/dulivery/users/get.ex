defmodule Dulivery.Users.Get do
  alias Dulivery.Exception.Error
  alias Dulivery.Repo
  alias Dulivery.Users.User

  def by_id(uuid) do
    case Repo.get(User, uuid) do
      nil -> {:error, Error.build_not_found_error("User")}
      user -> {:ok, user}
    end
  end
end
