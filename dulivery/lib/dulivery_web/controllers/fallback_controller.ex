defmodule DuliveryWeb.FallbackController do
  use DuliveryWeb, :controller

  alias Dulivery.Exception.Error
  alias DuliveryWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
