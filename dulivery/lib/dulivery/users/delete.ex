defmodule Dulivery.Users.Delete do
  alias Dulivery.Exception.Error
  alias Dulivery.Repo
  alias Dulivery.Users.User
  alias Ecto.UUID

  def call(uuid) do
    case UUID.cast(uuid) do
      :error -> {:error, Error.build_id_format_error()}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(uuid) do
    case Repo.get(User, uuid) do
      nil -> {:error, Error.build_not_found_error("User")}
      user -> Repo.delete(user)
    end
  end
end
