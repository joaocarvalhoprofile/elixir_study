defmodule Dulivery.Users.Delete do
  alias Dulivery.Repo
  alias Dulivery.Users.User
  alias Ecto.UUID

  def call(uuid) do
    case UUID.cast(uuid) do
      :error -> {:error, %{status: :bad_request, result: "invalid UUID format"}}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(uuid) do
    case Repo.get(User, uuid) do
      nil -> {:error, %{status: :not_found, result: "User not found!"}}
      user -> Repo.delete(user)
    end
  end
end
