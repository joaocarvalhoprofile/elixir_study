defmodule Dulivery.Users.Get do
  alias Dulivery.Exception.Error
  alias Dulivery.Repo
  alias Dulivery.Users.User
  alias Ecto.UUID

  def by_id(uuid) do
    case UUID.cast(uuid) do
      :error -> {:error, Error.build_id_format_error()}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(User, uuid) do
      nil -> {:error, Error.build_not_found_error("User")}
      user -> {:ok, user}
    end
  end
end
