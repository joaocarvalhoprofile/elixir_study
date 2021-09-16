defmodule DuliveryWeb.UsersController do
  use DuliveryWeb, :controller

  alias Dulivery.Users.User

  def create(conn, params) do
    with {:ok, %User{} = user} <- Dulivery.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
