defmodule Dulivery.Users.Create do
  alias Dulivery.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
