defmodule Dulivery.Users.Delete do
  alias Dulivery.Exception.Error
  alias Dulivery.Repo
  alias Dulivery.Users.User

  def call(uuid) do
    case Repo.get(User, uuid) do
      nil -> {:error, Error.build_not_found_error("User")}
      user -> Repo.delete(user)
    end
  end
end
