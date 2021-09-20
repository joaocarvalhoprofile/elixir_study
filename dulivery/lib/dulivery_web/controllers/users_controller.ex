defmodule DuliveryWeb.UsersController do
  use DuliveryWeb, :controller

  alias Dulivery.Users.User
  alias DuliveryWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Dulivery.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end

  def show(conn, %{"id" => uuid}) do
    with {:ok, %User{} = user} <- Dulivery.get_user_by_id(uuid) do
      conn
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end

  def delete(conn, %{"id" => uuid}) do
    with {:ok, %User{}} <- Dulivery.delete_user(uuid) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end

  def update(conn, params) do
    with {:ok, %User{} = user} <- Dulivery.update_user(params) do
      conn
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end
end
