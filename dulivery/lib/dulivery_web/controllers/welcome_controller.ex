defmodule DuliveryWeb.WelcomeController do
  use DuliveryWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> json(%{server: "dulivery web 2021"})
  end
end
