defmodule DuliveryWeb.ItemsController do
  use DuliveryWeb, :controller

  alias Dulivery.Items.Create, as: CreateUser
  alias Dulivery.Items.Item
  alias DuliveryWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Item{} = item} <- CreateUser.call(params) do
      conn
      |> put_status(:created)
      |> render("create.json", item: item)
    end
  end
end
