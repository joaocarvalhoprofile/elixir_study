defmodule Dulivery.Users.Get do
  alias Dulivery.Repo
  alias Dulivery.Users.User
  alias Ecto.UUID

  def by_id(uuid) do
    case UUID.cast(uuid) do
      :error -> {:error, %{status: :bad_request, result: "invalid UUID format"}}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(User, uuid) do
      nil -> {:error, %{status: :not_found, result: "User not found!"}}
      user -> {:ok, user}
    end
  end
end
