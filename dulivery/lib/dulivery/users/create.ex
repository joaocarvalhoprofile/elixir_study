defmodule Dulivery.Users.Create do
  alias Dulivery.Repo
  alias Dulivery.Users.User

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
