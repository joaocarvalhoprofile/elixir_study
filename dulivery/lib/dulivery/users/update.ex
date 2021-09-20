defmodule Dulivery.Users.Update do
  alias Dulivery.Exception.Error
  alias Dulivery.Repo
  alias Dulivery.Users.User

  def call(%{"id" => id} = params) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_not_found_error("User")}
      user -> do_update(user, params)
    end
  end

  defp do_update(user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
  end
end
